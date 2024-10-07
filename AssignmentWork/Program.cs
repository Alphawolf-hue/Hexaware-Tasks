using System.Buffers.Text;
using System.Globalization;
using System.Runtime.Intrinsics.X86;

namespace AssignmentWork
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Task 1
            #region Question 1
            /*1. Write a program that checks whether a given order is delivered or not based on its status (e.g.,
            "Processing," "Delivered," "Cancelled"). Use if-else statements for this.

            Console.WriteLine("Enter Order Status in(Processing,Delivered,Cancelled)");
            string status = Console.ReadLine();
            if (status == "Processing")
            {
                Console.WriteLine($"Order is Processing");
            }
            else if (status == "Delivered")
            {
                Console.WriteLine($"Order is Delivered");
            }
            else if (status == "Cancelled")
            {
                Console.WriteLine($"Order has been cancelled");
            }
            else
            {
                Console.WriteLine($"Status Invalid");
            }*/
            #endregion
            #region Question 2
            //2. Implement a switch-case statement to categorize parcels based on their weight into "Light,"
            // "Medium," or "Heavy."
            /* Console.WriteLine("Enter Weight of parcels");
             int weight =int.Parse(Console.ReadLine());
             char weightGrade;
             if (weight > 0 && weight <= 20)
             {
                 weightGrade = 'A';
             }
             else if (weight > 20 && weight < 50)
             {
                 weightGrade = 'B';
             }
             else if (weight > 50 && weight < 200)
             {
                 weightGrade = 'C';
             }
             else
             {
                 weightGrade = 'X';
             }
             switch (weightGrade)
             {
                 case 'A':
                     Console.WriteLine($"Light");
                     break;
                 case 'B':
                     Console.WriteLine($"Medium");
                     break;
                 case 'C':
                     Console.WriteLine($"Heavy");
                     break;
                 default: Console.WriteLine("Cannot be parceled");
                     break;
             }*/
            #endregion
            #region Question 3 undone 
            /*Console.WriteLine("Press 1 for Customer");
            Console.WriteLine("Press 2 for Employee");
            Console.WriteLine("Enter your choice:");
            int choice = int.Parse(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    int cust_choice = 0;
                    do
                    {
                        Console.WriteLine("Press 1 for Login");
                        Console.WriteLine("Press 2 for registration");
                        Console.WriteLine("Press 3 for Exit");
                        cust_choice = int.Parse(Console.Readline());
                        switch (cust_choice)
                        {
                            case 1:
                                Console.WriteLine("Enter Your email");
                                string cust = Console.ReadLine();
                                Console.WriteLine("Registration Successful");
                                break;
                            case 2:
                                Console.WriteLine("Enter your email");
                                string input = Console.ReadLine();
                                if (input == cust)
                                {
                                    Console.WriteLine($"Welcome {input}");
                                }
                                else { Console.WriteLine("Register first"); }
                        } while (choice != 3) ;*/
            #endregion
            #region Question 4
            /*Implement Courier Assignment Logic 1.Develop a mechanism to assign couriers to shipments based
            on predefined criteria(e.g., proximity, load capacity) using loops.
            int[] courierLocations = { 10, 20, 30, 40 };
            int[] courierCapacities = { 50, 60, 40, 80 };

            int[] shipmentLocations = { 25, 35, 15 };
            int[] shipmentWeights = { 30, 40, 20 };

            for (int i = 0; i < shipmentLocations.Length; i++)
            {
                int shipmentLocation = shipmentLocations[i];
                int shipmentWeight = shipmentWeights[i];

                int assignedCourier = -1;
                int minimumDistance = int.MaxValue;

                for (int j = 0; j < courierLocations.Length; j++)
                {
                    int courierLocation = courierLocations[j];
                    int courierCapacity = courierCapacities[j];

                    if (courierCapacity >= shipmentWeight)
                    {
                        int distance = Math.Abs(shipmentLocation - courierLocation);

                        if (distance < minimumDistance)
                        {
                            minimumDistance = distance;
                            assignedCourier = j;
                        }
                    }
                }

                if (assignedCourier != -1)
                {
                    Console.WriteLine($"Shipment {i + 1} (Weight: {shipmentWeight}, Location: {shipmentLocation}) is assigned to Courier {assignedCourier + 1} (Location: {courierLocations[assignedCourier]}, Capacity: {courierCapacities[assignedCourier]}).");
                }
                else
                {
                    Console.WriteLine($"Shipment {i + 1} (Weight: {shipmentWeight}, Location: {shipmentLocation}) could not be assigned to any courier.");
                }
                */
            #endregion
            #endregion
            #region Task 2
            #region Question 5
            /*5. Write a Java program that uses a for loop to display all the orders for a specific customer*/
            /*Console.WriteLine("Enter the Customer name");
            string name=Console.ReadLine();
            Console.WriteLine("Enter the number of orders");
            int ordercount=int.Parse(Console.ReadLine());

            string[] orders=new string[ordercount];
            for (int i = 0; i < orders.Length; i++)
            {
                Console.Write($"order no{i+1}:");
                orders[i] = Console.ReadLine();
            }
            Console.WriteLine($"\nOrders for customer {name}");
            for (int i = 0; i < orders.Length; i++)
            {
                Console.WriteLine($"orders {i + 1}:{orders[i]}");
            }*/
            #endregion
            #region Question_6
            //6. Implement a while loop to track the real-time location of a courier until it reaches its destination. 
            //int currentLocattion = 0;
            //int destination = 4;
            //while (currentLocattion < destination)
            //{
            //    Console.WriteLine($"The remaining distance is {destination - currentLocattion}");
            //    currentLocattion++;
            //}
            //Console.WriteLine("Reached");
            #endregion

            #endregion
            #region Task 3 Q7
            /*7.Create an array to store the tracking history of a parcel, where each entry represents a location update*/
            //List<string> location = new List<string>();
            //string choice;
            //string loc;
            //do
            //{
            //    Console.WriteLine("Enter current location: ");
            //    loc = Console.ReadLine();
            //    location.Add(loc);
            //    Console.WriteLine("Do u want to continue? (y/n)");
            //    choice = Console.ReadLine();
            //} while (choice == "y");
            //Console.WriteLine($"The tracking history is:");
            //foreach (string item in location)
            //{
            //    Console.WriteLine(item);
            //}
            #endregion
            #region Q8           
            // string[] courierNames = new string[] { "Courier A", "Courier B", "Courier C", "Courier D" };
            //    double[] courierDistances = new double[] { 5.0, 3.2, 7.8, 2.5 };
            //    string nearestCourier = FindNearestCourier(courierNames, courierDistances);
            //    Console.WriteLine($"The nearest courier is {nearestCourier}.");
            //    #endregion
            //}
            //#region Method for Q8
            //public static string FindNearestCourier(string[] courierNames, double[] courierDistances)
            //{
            //    int nearest = 0;
            //    double minDistance = courierDistances[0];
            //    for (int i = 1; i < courierDistances.Length; i++)
            //    {
            //        if (courierDistances[i] < minDistance)
            //        {
            //            minDistance = courierDistances[i];
            //            nearest = i;
            //        }
            //    }
            //    return courierNames[nearest];
            #endregion
            #region Task4 Q9

            //string[,] parcels = new string[,]
            //    {
            //    { "1001", "In Transit" },
            //    { "1002", "Out for Delivery" },
            //    { "1003", "Delivered" },
            //    { "1004", "Processing" },
            //    { "1005", "Shipped" }
            //    };

            //Console.WriteLine("Enter the parcel tracking number:");
            //string trackingNumber = Console.ReadLine();

            //bool parcelFound = false;
            //for (int i = 0; i < parcels.GetLength(0); i++)
            //{
            //    if (parcels[i, 0] == trackingNumber)
            //    {
            //        string status = parcels[i, 1];
            //        parcelFound = true;

            //        switch (status)
            //        {
            //            case "In Transit":
            //                Console.WriteLine("Your parcel is currently in transit.");
            //                break;
            //            case "Out for Delivery":
            //                Console.WriteLine("Your parcel is out for delivery.");
            //                break;
            //            case "Delivered":
            //                Console.WriteLine("Your parcel has been delivered.");
            //                break;
            //            case "Processing":
            //                Console.WriteLine("Your parcel is being processed.");
            //                break;
            //            case "Shipped":
            //                Console.WriteLine("Your parcel has been shipped.");
            //                break;
            //            default:
            //                Console.WriteLine("Unknown status.");
            //                break;
            //        }
            //        break;
            //    }
            //}
            //if (!parcelFound)
            //{
            //    Console.WriteLine("Tracking number not found. Please try again.");
            //}
            #endregion
            #region Q10

            #endregion
            #region Q11
            //string FormatAddress(string street, string city, string state, string zip)
            //{
            //    TextInfo textInfo = CultureInfo.CurrentCulture.TextInfo;
            //    string formattedAddress = $"{textInfo.ToTitleCase(street.ToLower())}, {textInfo.ToTitleCase(city.ToLower())}, {state.ToUpper()} {zip.PadLeft(5, '0')}";
            //    return formattedAddress;
            //}

            //// Sample usage
            //Console.WriteLine(FormatAddress("123 main street", "new york", "ny", "10001"));
            #endregion
            #region Q12
            //Console.WriteLine("Enter Customer Name:");
            //string name = Console.ReadLine();

            //Console.WriteLine("Enter Order Number:");
            //long num = Convert.ToInt64(Console.ReadLine()); // Ensure it reads as a long

            //Console.WriteLine("Enter Delivery Address:");
            //string da = Console.ReadLine();

            //Console.WriteLine("Enter Expected Date (yyyy-mm-dd):");
            //DateTime exp = DateTime.Parse(Console.ReadLine());
            //string cm = genodcm(name, num, da, exp);
            //string genodcm(string name, long num, string da, DateTime exp)
            //{
            //    return $"Hello {name},\nYour Order Number {num} for your address:\n{da}\nExpected arrival date: {exp.ToShortDateString()}";
            //}
            //Console.WriteLine("\nOrder Confirmation:");
            //Console.WriteLine(cm);
            #endregion
            #region Q13
            //double CalculateShippingCost(double distance, double weight)
            //{
            //    const double baseRate = 5.00;
            //    const double costPerMile = 0.50;
            //    const double costPerPound = 1.00;
            //    return baseRate + (costPerMile * distance) + (costPerPound * weight);
            //}

            //Console.WriteLine("Enter Distance");
            //double distance=double.Parse(Console.ReadLine());
            //Console.WriteLine("Enter Weight of your package");
            //double weight=double.Parse(Console.ReadLine()); 
            //Console.WriteLine(CalculateShippingCost(distance, weight));
            #endregion
        }
    }
}

