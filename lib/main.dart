import 'package:flutter/material.dart';
import 'package:budget/styles/app_text_styles.dart';
import 'package:budget/styles/app_colors.dart';
import 'package:budget/widgets/budget_card.dart';
import 'package:budget/widgets/engagement_success_dialog.dart';
import 'package:budget/widgets/percentage_text_field.dart';
import 'package:budget/widgets/currency_text_field.dart';

void main() => runApp(BudgetApp());

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BudgetScreen());
  }
}

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  bool allocateEvenly = true;

  final List<String> expenseTypes = [
    'Air Travel',
    'After Hours Support Management Fee',
    'Food & beverages',
    'Audio Visual (Venue)',
    'Audio Visual 3rd Party',
    'AV Coordination Management Fee',
  ];

  final List<Map<String, dynamic>> fields = [
    {'field': 'Air Travel', 'estimate': '2000', 'jacob': '70', 'jane': '20'},
    {
      'field': 'After Hours Support Management Fee',
      'estimate': '2000',
      'jacob': '70',
      'jane': '20',
      "edit": false,
    },
    {
      'field': 'Food & beverages',
      'estimate': '1000',
      'jacob': '25',
      'jane': '20',
      "edit": false,
    },
    {
      'field': 'Audio Visual (Venue)',
      'estimate': '10000',
      'jacob': '40',
      'jane': '20',
      "edit": false,
    },
    {
      'field': 'Audio Visual 3rd Party',
      'estimate': '1000',
      'jacob': '40',
      'jane': '20',
      "edit": false,
    },
    {
      'field': 'AV Coordination Management Fee',
      'estimate': '1000',
      'jacob': '40',
      'jane': '20',
      "edit": false,
    },
    {
      'field': 'After Hours Support Management Fee',
      'estimate': '4000',
      'jacob': '40',
      'jane': '20',
      "edit": false,
    },
  ];

  // Controllers for dynamic fields
  final List<TextEditingController> estimateControllers = [];
  final List<TextEditingController> jacobControllers = [];
  final List<TextEditingController> janeControllers = [];

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    estimateControllers.clear();
    jacobControllers.clear();
    janeControllers.clear();
    for (var field in fields) {
      estimateControllers.add(TextEditingController(text: field['estimate']));
      jacobControllers.add(
        TextEditingController(text: field['jacob'].toString()),
      );
      janeControllers.add(
        TextEditingController(text: field['jane'].toString()),
      );
    }
  }

  @override
  void dispose() {
    for (var c in estimateControllers) c.dispose();
    for (var c in jacobControllers) c.dispose();
    for (var c in janeControllers) c.dispose();
    super.dispose();
  }

  void _updateField(int index) {
    setState(() {
      fields[index]['estimate'] = estimateControllers[index].text;
      fields[index]['jacob'] = jacobControllers[index].text.replaceAll('%', '');
      fields[index]['jane'] = janeControllers[index].text.replaceAll('%', '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Budget", style: AppTextStyles.header),
            Text("Allocated Budget", style: AppTextStyles.subHeader),
            SizedBox(height: 12),
            Divider(color: AppColors.cardBorder),
            SizedBox(height: 12),
            Row(
              children: [
                BudgetCard(
                  title: "Allocate Estimated",
                  amount: "\$20,000",
                  icon: Icons.calculate,
                  iconBgColor: AppColors.iconBgGreen,
                  iconColor: AppColors.iconGreen,
                ),
                SizedBox(width: 10),
                BudgetCard(
                  title: "Budget Allocated",
                  amount: "\$30,000",
                  icon: Icons.account_balance_wallet,
                  iconBgColor: AppColors.iconBgBlue,
                  iconColor: AppColors.iconBlue,
                ),
                SizedBox(width: 10),
                BudgetCard(
                  title: "Remaining Budget",
                  amount: "\$200,000",
                  icon: Icons.receipt_long,
                  iconBgColor: AppColors.iconBgYellow,
                  iconColor: AppColors.iconYellow,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Allocate budget evenly to all Co-Owners",
                        style: AppTextStyles.body,
                      ),
                      SizedBox(width: 12),
                      Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Color(0xFF047481),
                        value: allocateEvenly,
                        onChanged: (val) {
                          setState(() {
                            allocateEvenly = val;
                          });
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        fields.insert(0, {
                          'field': expenseTypes.first,
                          'estimate': '',
                          'jacob': '',
                          'jane': '',
                          'edit': true,
                        });
                        estimateControllers.insert(0, TextEditingController());
                        jacobControllers.insert(0, TextEditingController());
                        janeControllers.insert(0, TextEditingController());
                      });
                    },
                    child: Text(
                      "Add New Expense Type",
                      style: AppTextStyles.linkText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(0.8),
                    2: FlexColumnWidth(0.5),
                    3: FlexColumnWidth(0.5),
                    4: FlexColumnWidth(0.4),
                  },
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: AppColors.divider,
                      width: 1,
                    ),
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: AppColors.background),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Field",
                            style: AppTextStyles.tableHeader,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Estimates",
                            style: AppTextStyles.tableHeader,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Jacob Jones",
                            style: AppTextStyles.tableHeader,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Jane Cooper",
                            style: AppTextStyles.tableHeader,
                          ),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),

                    for (int index = 0; index < fields.length; index++)
                      TableRow(
                        children: [
                          fields[index]['edit'] == true
                              ? Container(
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.border),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: DropdownButton<String>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                                    style: AppTextStyles.dropdownText,
                                    isExpanded: true,
                                    value: fields[index]['field'],
                                    underline: SizedBox(),
                                    onChanged: (val) {
                                      setState(() {
                                        fields[index]['field'] = val!;
                                      });
                                    },
                                    items: expenseTypes.map((type) {
                                      return DropdownMenuItem(
                                        value: type,
                                        child: Text(type),
                                      );
                                    }).toList(),
                                  ),
                                )
                              : Text(
                                  fields[index]['field'],
                                  style: AppTextStyles.tableCell,
                                ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              height: 46,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.border),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CurrencyTextField(
                                controller: estimateControllers[index],
                                onChanged: (_) => _updateField(index),
                                readOnly: fields[index]['edit'] != true,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: SizedBox(
                              height: 46,
                              width: 70,
                              child: PercentageTextField(
                                controller: jacobControllers[index],
                                onChanged: (_) => _updateField(index),
                                readOnly: fields[index]['edit'] != true,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: SizedBox(
                              height: 46,
                              width: 72,
                              child: PercentageTextField(
                                controller: janeControllers[index],
                                onChanged: (_) => _updateField(index),
                                readOnly: fields[index]['edit'] != true,
                              ),
                            ),
                          ),

                          fields[index]['edit'] == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          constraints: BoxConstraints(
                                            maxHeight: 30,
                                            maxWidth: 30,
                                          ),
                                          icon: Icon(
                                            Icons.check_outlined,
                                            size: 15,
                                          ),
                                          color: Colors.white,
                                          onPressed: () {
                                            _updateField(index);
                                            setState(() {
                                              fields[index]['edit'] = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.error,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          constraints: BoxConstraints(
                                            maxHeight: 30,
                                            maxWidth: 30,
                                          ),
                                          icon: Icon(
                                            Icons.close_outlined,
                                            size: 15,
                                          ),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              fields[index]['edit'] = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: PopupMenuButton<String>(
                                    icon: Icon(Icons.more_vert_outlined),
                                    onSelected: (value) {
                                      if (value == 'delete') {
                                        setState(() {
                                          fields.removeAt(index);
                                          estimateControllers.removeAt(index);
                                          jacobControllers.removeAt(index);
                                          janeControllers.removeAt(index);
                                        });
                                      }
                                      if (value == 'edit') {
                                        setState(() {
                                          fields[index]['edit'] = true;
                                        });
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: Text('Edit'),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(109, 40),
                    backgroundColor: AppColors.background,
                    side: BorderSide(color: AppColors.background),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const EngagementSuccessDialog(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(109, 40),
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: AppColors.cardWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
