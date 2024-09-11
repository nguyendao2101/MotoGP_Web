import 'package:flutter/material.dart';
import '../common/image_extention.dart';
import 'calendar_grands_prix.dart';
import 'grand_prix_card.dart'; // Đảm bảo bạn đã import đúng file

class CalendarAllEvents extends StatefulWidget {
  const CalendarAllEvents({super.key});

  @override
  State<CalendarAllEvents> createState() => _CalendarAllEventsState();
}

class _CalendarAllEventsState extends State<CalendarAllEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            children: [
              _grandsPrixMonth('November'),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '28',
                space: '',
                dayEnd: '      ',
                grandPrixName: 'Valencia MotoGP™ Official Test',
                location: 'Circuit Ricardo Tormo',
                monthStart: 'NOV',
                monthEnd: '',
                gpNumber: 'TEST',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.val,
                grandPrixImage: ImageAssest.grandsGP20,
              ),
              _sizeboxH40(),
              _grandsPrixMonth('February'),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '02',
                space: '-',
                dayEnd: '03',
                grandPrixName: 'Sepang Shakedown MotoGP™ Official Test',
                location: 'Petronas Sepang International Circuit',
                monthStart: 'FEB',
                monthEnd: 'FEB',
                gpNumber: 'TEST',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.malaysia,
                grandPrixImage: ImageAssest.grandsGP19,
              ),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '06',
                space: '-',
                dayEnd: '08',
                grandPrixName: 'Sepang MotoGP™ Official Test',
                location: 'Lusail International Circuit',
                monthStart: 'FEB',
                monthEnd: 'FEB',
                gpNumber: 'TEST',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.malaysia,
                grandPrixImage: ImageAssest.grandsGP19,
              ),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '19',
                space: '-',
                dayEnd: '20',
                grandPrixName: 'Qatar MotoGP™ Official Test',
                location: 'Lusail International Circuit',
                monthStart: 'FEB',
                monthEnd: 'FEB',
                gpNumber: 'TEST',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.qutar,
                grandPrixImage: ImageAssest.grandsGP1,
              ),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '21',
                space: '-',
                dayEnd: '23',
                grandPrixName: 'Portimao MotoE™ Official Test',
                location: 'Autódromo Internacional do Algarve',
                monthStart: 'FEB',
                monthEnd: 'FEB',
                gpNumber: 'TEST',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.boDaoNha,
                grandPrixImage: ImageAssest.grandsGP2,
              ),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '28',
                space: '-',
                dayEnd: '01',
                grandPrixName: 'Jerez Moto2™ & Moto3™ Official Test',
                location: 'Circuito de Jerez - Ángel Nieto',
                monthStart: 'FEB',
                monthEnd: 'MAR',
                gpNumber: 'TEST',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.tayBanNha,
                grandPrixImage: ImageAssest.grandsGP4,
              ),
              _sizeboxH40(),
              _grandsPrixMonth('March'),
              _sizeboxH40(),
              GrandPrixCard(
                dayStart: '08',
                space: '-',
                dayEnd: '10',
                grandPrixName: 'Quatar Airways Grand Prix of Quatar',
                location: 'Lusail International Circuit',
                monthStart: 'MAR',
                monthEnd: 'MAR',
                gpNumber: 'GP1',
                raceStatus: 'Finished',
                grandCountry: ImageAssest.qutar,
                grandPrixImage: ImageAssest.grandsGP1,
              ),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '22',
                  space: '-',
                  dayEnd: '24',
                  grandPrixName: 'Grande Prémio Tissot de Portugal',
                  location: 'Autódromo Internacional do Algarve',
                  monthStart: 'MAR',
                  monthEnd: 'MAR',
                  gpNumber: 'GP2',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP2,
                  grandCountry: ImageAssest.boDaoNha),
              _sizeboxH40(),
              _grandsPrixMonth('April'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '12',
                  space: '-',
                  dayEnd: '14',
                  grandPrixName: 'Red Bull Grand Prix of The Americas',
                  location: 'Circuit Of The Americas',
                  monthStart: 'APR',
                  monthEnd: 'APR',
                  gpNumber: 'GP3',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP3,
                  grandCountry: ImageAssest.my),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '26',
                  space: '-',
                  dayEnd: '28',
                  grandPrixName: 'Gran Premio Estrella Galicia 0,0 de España',
                  location: 'Circuito de Jerez - Ángel Nieto',
                  monthStart: 'APR',
                  monthEnd: 'APR',
                  gpNumber: 'GP4',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP4,
                  grandCountry: ImageAssest.tayBanNha),
              _sizeboxH40(),
              _grandsPrixMonth('May'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '10',
                  space: '-',
                  dayEnd: '12',
                  grandPrixName: 'Michelin® Grand Prix de France',
                  location: 'Le Mans',
                  monthStart: 'MAY',
                  monthEnd: 'MAY',
                  gpNumber: 'GP5',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP5,
                  grandCountry: ImageAssest.phap),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '24',
                  space: '-',
                  dayEnd: '26',
                  grandPrixName: 'Gran Premi Monster Energy de Catalunya',
                  location: 'Circuit de Barcelona-Catalunya',
                  monthStart: 'MAY',
                  monthEnd: 'MAY',
                  gpNumber: 'GP6',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP6,
                  grandCountry: ImageAssest.duc),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '31',
                  space: '-',
                  dayEnd: '02',
                  grandPrixName: 'Gran Premio d’Italia Brembo',
                  location: 'Autodromo Internazionale del Mugello',
                  monthStart: 'MAY',
                  monthEnd: 'JUN',
                  gpNumber: 'GP7',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP7,
                  grandCountry: ImageAssest.y),
              _sizeboxH40(),
              _grandsPrixMonth('June'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '28',
                  space: '-',
                  dayEnd: '30',
                  grandPrixName: 'Motul TT Assen',
                  location: 'TT Circuit Assen',
                  monthStart: 'JUN',
                  monthEnd: 'JUN',
                  gpNumber: 'GP8',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP8,
                  grandCountry: ImageAssest.halan),
              _sizeboxH40(),
              _grandsPrixMonth('July'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '05',
                  space: '-',
                  dayEnd: '07',
                  grandPrixName: 'Liqui Moly Motorrad Grand Prix Deutschland',
                  location: 'Sachsenring',
                  monthStart: 'JUL',
                  monthEnd: 'JUL',
                  gpNumber: 'GP9',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP9,
                  grandCountry: ImageAssest.duc),
              _sizeboxH40(),
              _grandsPrixMonth('August'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '02',
                  space: '-',
                  dayEnd: '04',
                  grandPrixName: 'Monster Energy British Grand Prix',
                  location: 'Silverstone Circuit',
                  monthStart: 'AUG',
                  monthEnd: 'AUG',
                  gpNumber: 'GP10',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP10,
                  grandCountry: ImageAssest.anh),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '16',
                  space: '-',
                  dayEnd: '18',
                  grandPrixName: 'Motorrad Grand Prix von Österreich',
                  location: 'ed Bull Ring - Spielberg',
                  monthStart: 'AUG',
                  monthEnd: 'AUG',
                  gpNumber: 'GP11',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP11,
                  grandCountry: ImageAssest.ao),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '30',
                  space: '-',
                  dayEnd: '01',
                  grandPrixName: 'Gran Premio GoPro de Aragón',
                  location: 'MotorLand Aragón',
                  monthStart: 'AUG',
                  monthEnd: 'SEP',
                  gpNumber: 'GP12',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP12,
                  grandCountry: ImageAssest.val),
              _sizeboxH40(),
              _grandsPrixMonth('September'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '06',
                  space: '-',
                  dayEnd: '08',
                  grandPrixName:
                      'Gran Premio Red Bull di San Marino e della Riviera di Rimini',
                  location: 'Misano World Circuit Marco Simoncelli',
                  monthStart: 'SEP',
                  monthEnd: 'SEP',
                  gpNumber: 'GP13',
                  raceStatus: 'Finished',
                  grandPrixImage: ImageAssest.grandsGP13,
                  grandCountry: ImageAssest.uc),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '20',
                  space: '-',
                  dayEnd: '22',
                  grandPrixName: 'Emilia-Romagna Grand Prix ',
                  location: 'Misano World Circuit Marco Simoncelli',
                  monthStart: 'SEP',
                  monthEnd: 'SEP',
                  gpNumber: 'GP14',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP14,
                  grandCountry: ImageAssest.y),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '27',
                  space: '-',
                  dayEnd: '29',
                  grandPrixName: 'Pertamina Grand Prix of Indonesia',
                  location: 'Pertamina Mandalika Circuit',
                  monthStart: 'SEP',
                  monthEnd: 'SEP',
                  gpNumber: 'GP15',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP15,
                  grandCountry: ImageAssest.indonesia),
              _sizeboxH40(),
              _grandsPrixMonth('October'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '04',
                  space: '-',
                  dayEnd: '06',
                  grandPrixName: 'Motul Grand Prix of Japan',
                  location: 'Mobility Resort Motegi',
                  monthStart: 'OCT',
                  monthEnd: 'OCT',
                  gpNumber: 'GP16',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP16,
                  grandCountry: ImageAssest.nhat),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '18',
                  space: '-',
                  dayEnd: '20',
                  grandPrixName:
                      'Qatar Airways Australian Motorcycle Grand Prix',
                  location: 'Phillip Island',
                  monthStart: 'OCT',
                  monthEnd: 'OCT',
                  gpNumber: 'GP17',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP17,
                  grandCountry: ImageAssest.uc),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '25',
                  space: '-',
                  dayEnd: '27',
                  grandPrixName: 'PT Grand Prix of Thailand',
                  location: 'Chang International Circuit',
                  monthStart: 'OCT',
                  monthEnd: 'OCT',
                  gpNumber: 'GP18',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP18,
                  grandCountry: ImageAssest.thaiLan),
              _sizeboxH40(),
              _grandsPrixMonth('November'),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '01',
                  space: '-',
                  dayEnd: '03',
                  grandPrixName: 'PETRONAS Grand Prix of Malaysia',
                  location: 'Petronas Sepang International Circuit',
                  monthStart: 'NOV',
                  monthEnd: 'NOV',
                  gpNumber: 'GP19',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP19,
                  grandCountry: ImageAssest.malaysia),
              _sizeboxH40(),
              GrandPrixCard(
                  dayStart: '15',
                  space: '-',
                  dayEnd: '17',
                  grandPrixName: 'Gran Premio Motul de la Comunitat Valenciana',
                  location: 'Circuit Ricardo Tormo',
                  monthStart: 'NOV',
                  monthEnd: 'NOV',
                  gpNumber: 'GP20',
                  raceStatus: 'Upcoming',
                  grandPrixImage: ImageAssest.grandsGP20,
                  grandCountry: ImageAssest.val),
              _sizeboxH40(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _sizeboxH40() => const SizedBox(height: 40);

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(ImageAssest.redFlag, height: 44),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
