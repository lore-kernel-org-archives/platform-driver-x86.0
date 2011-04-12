From: Manuel Lauss <manuel.lauss@googlemail.com>
Subject: 2.6.39-rc3: sony-laptop regression
Date: Tue, 12 Apr 2011 08:47:36 +0200
Message-ID: <BANLkTimXEDriJ7wNX25Ko0iu=dnuCXNQww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:56008 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756619Ab1DLGrh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2011 02:47:37 -0400
Received: by wya21 with SMTP id 21so5414359wya.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2011 23:47:36 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

Hello Mattia,

sony-laptop bugs out with a null ptr dereference on my VGN-A197 (see below).
A temporary fix is to check if handles is NULL in sony_find_snc_handle:

diff --git a/drivers/platform/x86/sony-laptop.c
b/drivers/platform/x86/sony-laptop.c
index e642f5f..bb58894 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -808,6 +808,10 @@ static int sony_nc_handles_cleanup(struct
platform_device *pd)
 static int sony_find_snc_handle(int handle)
 {
        int i;
+       if (!handles) {
+               dprintk("handles not set up!\n");
+               return -1;
+       }
        for (i = 0; i < 0x10; i++) {
                if (handles->cap[i] == handle) {
                        dprintk("found handle 0x%.4x (offset: 0x%.2x)\n",


sony-laptop: Sony Programmable IO Control Driver v0.6.
sony-laptop: detected Type2 model
sony-laptop: Evaluating _STA
sony-laptop: Device disabled
sony-laptop: Evaluating _PRS
sony-laptop: IO1 at 0x1080 (0x20)
sony-laptop: IO1 at 0x10a0 (0x20)
sony-laptop: IO1 at 0x10c0 (0x20)
sony-laptop: IO1 at 0x10e0 (0x20)
input: Sony Vaio Keys as
/devices/LNXSYSTM:00/device:00/PNP0A03:00/device:10/SNY6001:00/input/input6
input: Sony Vaio Jogdial as /devices/virtual/input/input7
sony-laptop: device allocated minor is 54
sony-laptop: I/O port1: 0x1080 (0x1080) + 0x20
sony-laptop: event ([0e] [05]) at port 0x1080(+0x12)
sony-laptop: unknown event ([0e] [05]) at port 0x1080(+0x12)
sony-laptop: IRQ: 6 - triggering: 1 - polarity: 0 - shr: 0
sony-laptop: Evaluating _SRS
sony-laptop: sony_pic_call1(0x82): 0x0e0a
sony-laptop: event ([0e] [05]) at port 0x1080(+0x12)
sony-laptop: unknown event ([0e] [05]) at port 0x1080(+0x12)
sony-laptop: sony_pic_call2(0x81 - 0xff): 0x000e
sony-laptop: sony_pic_call1(0x82): 0x0e0a
sony-laptop: event ([00] [05]) at port 0x1080(+0x12)
sony-laptop: event ([0e] [05]) at port 0x1080(+0x12)
sony-laptop: unknown event ([0e] [05]) at port 0x1080(+0x12)
sony-laptop: Sony Notebook Control Driver v0.6.
sony-laptop: method: name: GBRT, args 0
sony-laptop: method: name: SBRT, args 1
sony-laptop: method: name: GPBR, args 0
sony-laptop: method: name: SPBR, args 1
sony-laptop: method: name: PWAK, args 0
sony-laptop: method: name: CSXB, args 1
sony-laptop: method: name: GWDP, args 0
sony-laptop: method: name: RBMF, args 1
sony-laptop: method: name: RSBI, args 1
sony-laptop: method: name: CBMF, args 1
BUG: unable to handle kernel NULL pointer dereference at   (null)
IP: [<f07af0b0>] sony_find_snc_handle+0x10/0x70 [sony_laptop]
*pde = 00000000
Oops: 0000 [#1] PREEMPT
last sysfs file: /sys/bus/platform/drivers/sony-laptop/uevent
Modules linked in: sony_laptop(+) ipw2200 libipw

Pid: 2419, comm: modprobe Not tainted 2.6.39-rc2-00139-g4263a2f #1
Sony Corporation VGN-A197XP(DE)
EIP: 0060:[<f07af0b0>] EFLAGS: 00010296 CPU: 0
EIP is at sony_find_snc_handle+0x10/0x70 [sony_laptop]
EAX: 0000012f EBX: 00000000 ECX: 00000000 EDX: 00000030
ESI: ec2a3e00 EDI: ef1bf400 EBP: 00000000 ESP: ec2a3dac
DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
Process modprobe (pid: 2419, ti=ec2a2000 task=ec1c5cb0 task.ti=ec2a2000)
Stack:
00000000 ec2a3e00 ef1bf400 00000000 f07b25d6 f07b00b0 00000000 00000000
00000000 ef1becc4 00000000 b10f52f9 ec2a3e14 ec2d8cf4 ec2a3e14 b10f4b0c
b10f4813 000041ed ec2d5820 ec2dda40 ef1becc4 00000000 ef1bf400 f07b4040
Call Trace:
[<f07b25d6>] ? sony_nc_add+0x286/0x86a [sony_laptop]
[<f07b00b0>] ? sony_nc_update_status_ng+0x30/0x30 [sony_laptop]
[<b10f52f9>] ? sysfs_do_create_link+0xc9/0x200
[<b10f4b0c>] ? sysfs_add_one+0x1c/0xb0
[<b10f4813>] ? sysfs_addrm_finish+0x13/0xa0
[<b13f129f>] ? acpi_device_probe+0x37/0xee
[<b1508865>] ? driver_probe_device+0x85/0x190
[<b13f169f>] ? acpi_match_device_ids+0x27/0x4e
[<b15089e9>] ? __driver_attach+0x79/0x80
[<b1508970>] ? driver_probe_device+0x190/0x190
[<b1507b1b>] ? bus_for_each_dev+0x4b/0x70
[<b1508586>] ? driver_attach+0x16/0x20
[<b1508970>] ? driver_probe_device+0x190/0x190
[<b150819d>] ? bus_add_driver+0x9d/0x250
[<b13f11dc>] ? acpi_device_hid+0x13/0x13
[<b1508ee7>] ? driver_register+0x57/0xf0
[<f07e204d>] ? sony_laptop_init+0x4d/0x79 [sony_laptop]
[<b10011f3>] ? do_one_initcall+0x33/0x170
[<b104519d>] ? __blocking_notifier_call_chain+0x4d/0x60
[<f07e2000>] ? 0xf07e1fff
[<b1054691>] ? sys_init_module+0x151/0x1980
[<b109d0f9>] ? sys_close+0x69/0xe0
[<b17bfd4c>] ? sysenter_do_call+0x12/0x22
Code: 00 00 00 89 d1 ba 98 4c 7b f0 ff 13 eb d4 8d b6 00 00 00 00 8d
bc 27 00 00 00 00 53 31 db 83 ec 0c 8b 0d 08 4d 7b f0 8d 74 26 00 <0f>
b7 14 5
EIP: [<f07af0b0>] sony_find_snc_handle+0x10/0x70 [sony_laptop] SS:ESP
0068:ec2a3dac
CR2: 0000000000000000
---[ end trace cc9f92a792889ac4 ]---


Best regards,
       Manuel Lauss
