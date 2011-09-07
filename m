From: AceLan Kao <acelan@gmail.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Wed, 7 Sep 2011 13:29:21 +0800
Message-ID: <CAMz9Wg8jVxMo6bqWb7Kb1D-7Mbt+AoYeMhjJccgqe=jxbqVu_Q@mail.gmail.com>
References: <4E440A530200002300030503@novprvlin0050.provo.novell.com>
	<CAMz9Wg_B8ZQ9_6=62N-h0FWsA2csDbwxbYwS+s+u-jVSujKysQ@mail.gmail.com>
	<1315362788.17536.347.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e649bcf6faf82c04ac5339c5
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:49338 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751744Ab1IGF3X (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Sep 2011 01:29:23 -0400
Received: by qyk7 with SMTP id 7so436823qyk.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Sep 2011 22:29:22 -0700 (PDT)
In-Reply-To: <1315362788.17536.347.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

--0016e649bcf6faf82c04ac5339c5
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: quoted-printable

Sure, here it is.

2011/9/7 joeyli <jlee@suse.com>:
> Hi AceLan,
>
> I am tracing a issue related to hotkey define.
> Could you please share dmidecode to me on your machine?
>
>
> Thank's a lot!
> Joey Lee
>
> =A9=F3 =A5|=A1A2011-08-11 =A9=F3 15:45 +0800=A1AAceLan Kao =B4=A3=A8=EC=
=A1G
>> Dear Joey,
>>
>> Good, that looks more reasonable to me.
>>
>> Yes, my machine has wifi module on it, but the wifi hotkey event is
>> handled by BIOS, so the wifi toggle works as expected.
>> I still got the failed message, but we can take it as a BIOS bug and
>> leave it there.
>>
>> BTW, your patches work well on my machine, thanks for your hard work.
>> You can have my signature on your patches.
>> Tested-by: AceLan Kao <acelan.kao@canonical.com>
>>
>> Best regards,
>> AceLan Kao.
>>
>> 2011/8/11 Joey Lee <jlee@novell.com>:
>> > =A9=F3 =A5|=A1A2011-08-11 =A9=F3 03:30 +0000=A1Ajoeyli(Joey Lee) =B4=
=A3=A8=EC=A1G
>> >> =A9=F3 =A5|=A1A2011-08-11 =A9=F3 10:48 +0800=A1AAceLan Kao =B4=A3=A8=
=EC=A1G
>> >> > Dear Joey,
>> >> >
>> >> > This is the dmesg log.
>> >> > [ 9010.944053] acer_wmi: Acer Laptop ACPI-WMI Extras
>> >> > [ 9010.944071] acer_wmi: Function bitmap for Communication Button: =
0x1
>> >
>> > Per this log, the 0x1 means your machine have wifi hardware module and
>> > BIOS detected it then write information to SMBIOS area.
>> >
>> >> > [ 9010.944075] acer_wmi: Brightness must be controlled by generic v=
ideo driver
>> >> > [ 9010.944996] input: Acer WMI hotkeys as /devices/virtual/input/in=
put21
>> >> > [ 9010.947095] acer_wmi: Set Device Status failed: 0xe2 - 0x0
>> >> >
>> >
>> > But,
>> > here have problem when acer-wmi driver try to set the state by
>> > WMID_GUID3 method, the wmi function response 0xe2.
>> >
>> >> > And after adding my quirk, the set device status still failed, but
>> >> > except that, everything works well.
>> >> >
>> >>
>> >> So, you machine have wifi hardware module or not?
>> >>
>> >> > The "failed" comes from acer_rfkill_init(), it'll call
>> >> > acer_rfkill_register() with ACER_CAP_WIRELESS parameter without
>> >> > checking the capability.
>> >> > I don't know why only wifi doesn't check the capability and call
>> >> > acer_rfkill_register() directly, but it doesn't hurt the system.
>> >> >
>> >> > =3D=3D=3D
>> >> > static int acer_rfkill_init(struct device *dev)
>> >> > {
>> >> >         wireless_rfkill =3D acer_rfkill_register(dev, RFKILL_TYPE_W=
LAN,
>> >> >                 "acer-wireless", ACER_CAP_WIRELESS);
>> >> >         if (IS_ERR(wireless_rfkill))
>> >> >                 return PTR_ERR(wireless_rfkill);
>> >> > =3D=3D=3D
>> >> >
>> >> > Best regards,
>> >> > AceLan Kao.
>> >> >
>> >>
>> >> I checked the history, looks like it's just a original design in old
>> >> patch.
>> >>
>> >> Yes, you are right, add ACER_CAP_WIRELESS check is better. I am doing
>> >> generate a patch to add ACER_CAP_WIRELESS check.
>> >> Will attached patch on mail.
>> >>
>> >>
>> >> Thank's
>> >> Joey Lee
>> >>
>> >
>> > Please let me know does there have any wifi module in your machine whe=
n
>> > you test?
>> > If yes, then you need contact with BIOS team for why the WMID_GUID3
>> > method response 0xe2 when set device state, because this function work=
s
>> > find on my TravelMate 8572 machine.
>> >
>> > On the other hand,
>> > The following is patch to check the ACER_CAP_WIRELESS before generate
>> > wireless rfkill.
>> >
>> >
>> > Thank's
>> > Joey Lee
>> >
>> > >From 18c20f2b40bc64ec72b52ae2e4d994237173f982 Mon Sep 17 00:00:00 200=
1
>> > From: Lee, Chun-Yi <jlee@suse.com>
>> > Date: Thu, 11 Aug 2011 12:49:53 +0800
>> > Subject: [PATCH] acer-wmi: check wireless capability flag before regis=
ter rfkill
>> >
>> > There will be better to check the wireless capability flag
>> > (ACER_CAP_WIRELESS) before register wireless rfkill because maybe
>> > the machine doesn't have wifi module or the module removed by user.
>> >
>> > Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
>> > ---
>> >  drivers/platform/x86/acer-wmi.c |   64 +++++++++++++++++++++++++-----=
--------
>> >  1 files changed, 42 insertions(+), 22 deletions(-)
>> >
>> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ac=
er-wmi.c
>> > index 712a505..b4078c4 100644
>> > --- a/drivers/platform/x86/acer-wmi.c
>> > +++ b/drivers/platform/x86/acer-wmi.c
>> > @@ -1289,12 +1289,13 @@ static void acer_rfkill_update(struct work_str=
uct *ignored)
>> >        u32 state;
>> >        acpi_status status;
>> >
>> > -       status =3D get_u32(&state, ACER_CAP_WIRELESS);
>> > -       if (ACPI_SUCCESS(status)) {
>> > -               if (quirks->wireless =3D=3D 3) {
>> > -                       rfkill_set_hw_state(wireless_rfkill, !state);
>> > -               } else {
>> > -                       rfkill_set_sw_state(wireless_rfkill, !state);
>> > +       if (has_cap(ACER_CAP_WIRELESS)) {
>> > +               status =3D get_u32(&state, ACER_CAP_WIRELESS);
>> > +               if (ACPI_SUCCESS(status)) {
>> > +                       if (quirks->wireless =3D=3D 3)
>> > +                               rfkill_set_hw_state(wireless_rfkill, !=
state);
>> > +                       else
>> > +                               rfkill_set_sw_state(wireless_rfkill, !=
state);
>> >                }
>> >        }
>> >
>> > @@ -1362,19 +1363,24 @@ static struct rfkill *acer_rfkill_register(str=
uct device *dev,
>> >
>> >  static int acer_rfkill_init(struct device *dev)
>> >  {
>> > -       wireless_rfkill =3D acer_rfkill_register(dev, RFKILL_TYPE_WLAN=
,
>> > -               "acer-wireless", ACER_CAP_WIRELESS);
>> > -       if (IS_ERR(wireless_rfkill))
>> > -               return PTR_ERR(wireless_rfkill);
>> > +       int err;
>> > +
>> > +       if (has_cap(ACER_CAP_WIRELESS)) {
>> > +               wireless_rfkill =3D acer_rfkill_register(dev, RFKILL_T=
YPE_WLAN,
>> > +                       "acer-wireless", ACER_CAP_WIRELESS);
>> > +               if (IS_ERR(wireless_rfkill)) {
>> > +                       err =3D PTR_ERR(wireless_rfkill);
>> > +                       goto error_wireless;
>> > +               }
>> > +       }
>> >
>> >        if (has_cap(ACER_CAP_BLUETOOTH)) {
>> >                bluetooth_rfkill =3D acer_rfkill_register(dev,
>> >                        RFKILL_TYPE_BLUETOOTH, "acer-bluetooth",
>> >                        ACER_CAP_BLUETOOTH);
>> >                if (IS_ERR(bluetooth_rfkill)) {
>> > -                       rfkill_unregister(wireless_rfkill);
>> > -                       rfkill_destroy(wireless_rfkill);
>> > -                       return PTR_ERR(bluetooth_rfkill);
>> > +                       err =3D PTR_ERR(bluetooth_rfkill);
>> > +                       goto error_bluetooth;
>> >                }
>> >        }
>> >
>> > @@ -1383,30 +1389,44 @@ static int acer_rfkill_init(struct device *dev=
)
>> >                        RFKILL_TYPE_WWAN, "acer-threeg",
>> >                        ACER_CAP_THREEG);
>> >                if (IS_ERR(threeg_rfkill)) {
>> > -                       rfkill_unregister(wireless_rfkill);
>> > -                       rfkill_destroy(wireless_rfkill);
>> > -                       rfkill_unregister(bluetooth_rfkill);
>> > -                       rfkill_destroy(bluetooth_rfkill);
>> > -                       return PTR_ERR(threeg_rfkill);
>> > +                       err =3D PTR_ERR(threeg_rfkill);
>> > +                       goto error_threeg;
>> >                }
>> >        }
>> >
>> >        rfkill_inited =3D true;
>> >
>> > -       if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
>> > +       if ((ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID)) &&
>> > +           has_cap(ACER_CAP_WIRELESS | ACER_CAP_BLUETOOTH | ACER_CAP_=
THREEG))
>> >                schedule_delayed_work(&acer_rfkill_work,
>> >                        round_jiffies_relative(HZ));
>> >
>> >        return 0;
>> > +
>> > +error_threeg:
>> > +       if (has_cap(ACER_CAP_BLUETOOTH)) {
>> > +               rfkill_unregister(bluetooth_rfkill);
>> > +               rfkill_destroy(bluetooth_rfkill);
>> > +       }
>> > +error_bluetooth:
>> > +       if (has_cap(ACER_CAP_WIRELESS)) {
>> > +               rfkill_unregister(wireless_rfkill);
>> > +               rfkill_destroy(wireless_rfkill);
>> > +       }
>> > +error_wireless:
>> > +       return err;
>> >  }
>> >
>> >  static void acer_rfkill_exit(void)
>> >  {
>> > -       if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
>> > +       if ((ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID)) &&
>> > +           has_cap(ACER_CAP_WIRELESS | ACER_CAP_BLUETOOTH | ACER_CAP_=
THREEG))
>> >                cancel_delayed_work_sync(&acer_rfkill_work);
>> >
>> > -       rfkill_unregister(wireless_rfkill);
>> > -       rfkill_destroy(wireless_rfkill);
>> > +       if (has_cap(ACER_CAP_WIRELESS)) {
>> > +               rfkill_unregister(wireless_rfkill);
>> > +               rfkill_destroy(wireless_rfkill);
>> > +       }
>> >
>> >        if (has_cap(ACER_CAP_BLUETOOTH)) {
>> >                rfkill_unregister(bluetooth_rfkill);
>> > --
>> > 1.6.0.2
>> >
>> >
>> >
>> >
>>
>>
>>
>> --
>> Chia-Lin Kao(AceLan)
>> http://blog.acelan.idv.tw/
>> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-drive=
r-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

--0016e649bcf6faf82c04ac5339c5
Content-Type: text/x-log; charset=US-ASCII; name="dmidecode.log"
Content-Disposition: attachment; filename="dmidecode.log"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gs9vbdh30

IyBkbWlkZWNvZGUgMi45ClNNQklPUyAyLjYgcHJlc2VudC4KNTEgc3RydWN0dXJlcyBvY2N1cHlp
bmcgMjM4NCBieXRlcy4KVGFibGUgYXQgMHgwMDBFOUFFMC4KCkhhbmRsZSAweDAwMDAsIERNSSB0
eXBlIDAsIDI0IGJ5dGVzCkJJT1MgSW5mb3JtYXRpb24KCVZlbmRvcjogSU5TWURFCglWZXJzaW9u
OiBWMS4wNVRECglSZWxlYXNlIERhdGU6IDA3LzI1LzIwMTEKCVJPTSBTaXplOiAyMDQ4IGtCCglD
aGFyYWN0ZXJpc3RpY3M6CgkJUENJIGlzIHN1cHBvcnRlZAoJCUJJT1MgaXMgdXBncmFkZWFibGUK
CQlCSU9TIHNoYWRvd2luZyBpcyBhbGxvd2VkCgkJQm9vdCBmcm9tIENEIGlzIHN1cHBvcnRlZAoJ
CVNlbGVjdGFibGUgYm9vdCBpcyBzdXBwb3J0ZWQKCQlFREQgaXMgc3VwcG9ydGVkCgkJSmFwYW5l
c2UgZmxvcHB5IGZvciBORUMgOTgwMCAxLjIgTUIgaXMgc3VwcG9ydGVkIChpbnQgMTNoKQoJCUph
cGFuZXNlIGZsb3BweSBmb3IgVG9zaGliYSAxLjIgTUIgaXMgc3VwcG9ydGVkIChpbnQgMTNoKQoJ
CTUuMjUiLzM2MCBLQiBmbG9wcHkgc2VydmljZXMgYXJlIHN1cHBvcnRlZCAoaW50IDEzaCkKCQk1
LjI1Ii8xLjIgTUIgZmxvcHB5IHNlcnZpY2VzIGFyZSBzdXBwb3J0ZWQgKGludCAxM2gpCgkJMy41
Ii83MjAgS0IgZmxvcHB5IHNlcnZpY2VzIGFyZSBzdXBwb3J0ZWQgKGludCAxM2gpCgkJMy41Ii8y
Ljg4IE1CIGZsb3BweSBzZXJ2aWNlcyBhcmUgc3VwcG9ydGVkIChpbnQgMTNoKQoJCTgwNDIga2V5
Ym9hcmQgc2VydmljZXMgYXJlIHN1cHBvcnRlZCAoaW50IDloKQoJCUNHQS9tb25vIHZpZGVvIHNl
cnZpY2VzIGFyZSBzdXBwb3J0ZWQgKGludCAxMGgpCgkJQUNQSSBpcyBzdXBwb3J0ZWQKCQlVU0Ig
bGVnYWN5IGlzIHN1cHBvcnRlZAoJCUJJT1MgYm9vdCBzcGVjaWZpY2F0aW9uIGlzIHN1cHBvcnRl
ZAoJCVRhcmdldGVkIGNvbnRlbnQgZGlzdHJpYnV0aW9uIGlzIHN1cHBvcnRlZAoJQklPUyBSZXZp
c2lvbjogNS4xNTIKCkhhbmRsZSAweDAwMDEsIERNSSB0eXBlIDEsIDI3IGJ5dGVzClN5c3RlbSBJ
bmZvcm1hdGlvbgoJTWFudWZhY3R1cmVyOiBlTWFjaGluZXMKCVByb2R1Y3QgTmFtZTogQVM0NzM5
WgoJVmVyc2lvbjogVjEuMDVURAoJU2VyaWFsIE51bWJlcjogUzJSSzMwMjAwMjExMDA3ODIyMjUw
MAoJVVVJRDogQkJBRkMyREUtREExNi00RTYzLUEyMTgtNjBFQjY5RTZGNjlCCglXYWtlLXVwIFR5
cGU6IFBvd2VyIFN3aXRjaAoJU0tVIE51bWJlcjogQ2FscGVsbGFfQ1JCCglGYW1pbHk6IEludGVs
X01vYmlsZQoKSGFuZGxlIDB4MDAwMiwgRE1JIHR5cGUgMiwgMTYgYnl0ZXMKQmFzZSBCb2FyZCBJ
bmZvcm1hdGlvbgoJTWFudWZhY3R1cmVyOiBlTWFjaGluZXMKCVByb2R1Y3QgTmFtZTogSE1BX0NQ
CglWZXJzaW9uOiBCYXNlIEJvYXJkIFZlcnNpb24KCVNlcmlhbCBOdW1iZXI6IDExMEZDRUNNQlFU
MDAwMDcKCUFzc2V0IFRhZzogQmFzZSBCb2FyZCBBc3NldCBUYWcKCUZlYXR1cmVzOgoJCUJvYXJk
IGlzIGEgaG9zdGluZyBib2FyZAoJCUJvYXJkIGlzIHJlcGxhY2VhYmxlCglMb2NhdGlvbiBJbiBD
aGFzc2lzOiBCYXNlIEJvYXJkIENoYXNzaXMgTG9jYXRpb24KCUNoYXNzaXMgSGFuZGxlOiAweDAw
MDMKCVR5cGU6IE1vdGhlcmJvYXJkCglDb250YWluZWQgT2JqZWN0IEhhbmRsZXM6IDAKCkhhbmRs
ZSAweDAwMDMsIERNSSB0eXBlIDMsIDIzIGJ5dGVzCkNoYXNzaXMgSW5mb3JtYXRpb24KCU1hbnVm
YWN0dXJlcjogQ2hhc3NpcyBNYW51ZmFjdHVyZXIKCVR5cGU6IE5vdGVib29rCglMb2NrOiBOb3Qg
UHJlc2VudAoJVmVyc2lvbjogQ2hhc3NpcyBWZXJzaW9uCglTZXJpYWwgTnVtYmVyOiBDaGFzc2lz
IFNlcmlhbCBOdW1iZXIKCUFzc2V0IFRhZzogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKCUJvb3QtdXAgU3RhdGU6IFNhZmUKCVBvd2VyIFN1cHBseSBTdGF0ZTogU2FmZQoJVGhlcm1h
bCBTdGF0ZTogU2FmZQoJU2VjdXJpdHkgU3RhdHVzOiBOb25lCglPRU0gSW5mb3JtYXRpb246IDB4
MDAwMDAwMDAKCUhlaWdodDogVW5zcGVjaWZpZWQKCU51bWJlciBPZiBQb3dlciBDb3JkczogMQoJ
Q29udGFpbmVkIEVsZW1lbnRzOiAwCgpIYW5kbGUgMHgwMDA0LCBETUkgdHlwZSA5LCAxNyBieXRl
cwpTeXN0ZW0gU2xvdCBJbmZvcm1hdGlvbgoJRGVzaWduYXRpb246IEo1QzEKCVR5cGU6IHgxNiA8
T1VUIE9GIFNQRUM+CglDdXJyZW50IFVzYWdlOiBBdmFpbGFibGUKCUxlbmd0aDogT3RoZXIKCUNo
YXJhY3RlcmlzdGljczoKCQlQTUUgc2lnbmFsIGlzIHN1cHBvcnRlZAoJCUhvdC1wbHVnIGRldmlj
ZXMgYXJlIHN1cHBvcnRlZAoKSGFuZGxlIDB4MDAwNSwgRE1JIHR5cGUgOSwgMTcgYnl0ZXMKU3lz
dGVtIFNsb3QgSW5mb3JtYXRpb24KCURlc2lnbmF0aW9uOiBKNkMxCglUeXBlOiB4MSA8T1VUIE9G
IFNQRUM+CglDdXJyZW50IFVzYWdlOiBBdmFpbGFibGUKCUxlbmd0aDogT3RoZXIKCUNoYXJhY3Rl
cmlzdGljczoKCQlQTUUgc2lnbmFsIGlzIHN1cHBvcnRlZAoJCUhvdC1wbHVnIGRldmljZXMgYXJl
IHN1cHBvcnRlZAoKSGFuZGxlIDB4MDAwNiwgRE1JIHR5cGUgOSwgMTcgYnl0ZXMKU3lzdGVtIFNs
b3QgSW5mb3JtYXRpb24KCURlc2lnbmF0aW9uOiBKNkMyCglUeXBlOiB4MSA8T1VUIE9GIFNQRUM+
CglDdXJyZW50IFVzYWdlOiBBdmFpbGFibGUKCUxlbmd0aDogT3RoZXIKCUNoYXJhY3RlcmlzdGlj
czoKCQlQTUUgc2lnbmFsIGlzIHN1cHBvcnRlZAoJCUhvdC1wbHVnIGRldmljZXMgYXJlIHN1cHBv
cnRlZAoKSGFuZGxlIDB4MDAwNywgRE1JIHR5cGUgOSwgMTcgYnl0ZXMKU3lzdGVtIFNsb3QgSW5m
b3JtYXRpb24KCURlc2lnbmF0aW9uOiBKNkQyCglUeXBlOiB4MSA8T1VUIE9GIFNQRUM+CglDdXJy
ZW50IFVzYWdlOiBBdmFpbGFibGUKCUxlbmd0aDogT3RoZXIKCUNoYXJhY3RlcmlzdGljczoKCQlQ
TUUgc2lnbmFsIGlzIHN1cHBvcnRlZAoJCUhvdC1wbHVnIGRldmljZXMgYXJlIHN1cHBvcnRlZAoK
SGFuZGxlIDB4MDAwOCwgRE1JIHR5cGUgOSwgMTcgYnl0ZXMKU3lzdGVtIFNsb3QgSW5mb3JtYXRp
b24KCURlc2lnbmF0aW9uOiBKN0MxCglUeXBlOiB4MSA8T1VUIE9GIFNQRUM+CglDdXJyZW50IFVz
YWdlOiBBdmFpbGFibGUKCUxlbmd0aDogT3RoZXIKCUNoYXJhY3RlcmlzdGljczoKCQlQTUUgc2ln
bmFsIGlzIHN1cHBvcnRlZAoJCUhvdC1wbHVnIGRldmljZXMgYXJlIHN1cHBvcnRlZAoKSGFuZGxl
IDB4MDAwOSwgRE1JIHR5cGUgOSwgMTcgYnl0ZXMKU3lzdGVtIFNsb3QgSW5mb3JtYXRpb24KCURl
c2lnbmF0aW9uOiBKN0QyCglUeXBlOiB4MSA8T1VUIE9GIFNQRUM+CglDdXJyZW50IFVzYWdlOiBB
dmFpbGFibGUKCUxlbmd0aDogT3RoZXIKCUNoYXJhY3RlcmlzdGljczoKCQlQTUUgc2lnbmFsIGlz
IHN1cHBvcnRlZAoJCUhvdC1wbHVnIGRldmljZXMgYXJlIHN1cHBvcnRlZAoKSGFuZGxlIDB4MDAw
QSwgRE1JIHR5cGUgOSwgMTcgYnl0ZXMKU3lzdGVtIFNsb3QgSW5mb3JtYXRpb24KCURlc2lnbmF0
aW9uOiBKOEMyCglUeXBlOiB4MTYgPE9VVCBPRiBTUEVDPgoJQ3VycmVudCBVc2FnZTogQXZhaWxh
YmxlCglMZW5ndGg6IE90aGVyCglDaGFyYWN0ZXJpc3RpY3M6CgkJUE1FIHNpZ25hbCBpcyBzdXBw
b3J0ZWQKCQlIb3QtcGx1ZyBkZXZpY2VzIGFyZSBzdXBwb3J0ZWQKCkhhbmRsZSAweDAwMEIsIERN
SSB0eXBlIDksIDE3IGJ5dGVzClN5c3RlbSBTbG90IEluZm9ybWF0aW9uCglEZXNpZ25hdGlvbjog
SjhDMQoJVHlwZTogeDEgPE9VVCBPRiBTUEVDPgoJQ3VycmVudCBVc2FnZTogQXZhaWxhYmxlCglM
ZW5ndGg6IE90aGVyCglDaGFyYWN0ZXJpc3RpY3M6CgkJUE1FIHNpZ25hbCBpcyBzdXBwb3J0ZWQK
CQlIb3QtcGx1ZyBkZXZpY2VzIGFyZSBzdXBwb3J0ZWQKCkhhbmRsZSAweDAwMEMsIERNSSB0eXBl
IDExLCA1IGJ5dGVzCk9FTSBTdHJpbmdzCglTdHJpbmcgMTogU3RyaW5nMSBmb3IgT3JpZ2luYWwg
RXF1aXBtZW50IE1hbnVmYWN0dXJlcgoJU3RyaW5nIDI6IFN0cmluZzIgZm9yIE9yaWdpbmFsIEVx
dWlwbWVudCBNYW51ZmFjdHVyZXIKCVN0cmluZyAzOiBTdHJpbmczIGZvciBPcmlnaW5hbCBFcXVp
cG1lbnQgTWFudWZhY3R1cmVyCglTdHJpbmcgNDogU3RyaW5nNCBmb3IgT3JpZ2luYWwgRXF1aXBt
ZW50IE1hbnVmYWN0dXJlcgoJU3RyaW5nIDU6IFN0cmluZzUgZm9yIE9yaWdpbmFsIEVxdWlwbWVu
dCBNYW51ZmFjdHVyZXIKCkhhbmRsZSAweDAwMEQsIERNSSB0eXBlIDEyLCA1IGJ5dGVzClN5c3Rl
bSBDb25maWd1cmF0aW9uIE9wdGlvbnMKCU9wdGlvbiAxOiAgICAgICAgICAKCU9wdGlvbiAyOiBT
dHJpbmcyIGZvciBUeXBlMTIgRXF1aXBtZW50IE1hbnVmYWN0dXJlcgoJT3B0aW9uIDM6IFN0cmlu
ZzMgZm9yIFR5cGUxMiBFcXVpcG1lbnQgTWFudWZhY3R1cmVyCglPcHRpb24gNDogU3RyaW5nNCBm
b3IgVHlwZTEyIEVxdWlwbWVudCBNYW51ZmFjdHVyZXIKCkhhbmRsZSAweDAwMEUsIERNSSB0eXBl
IDIxLCA3IGJ5dGVzCkJ1aWx0LWluIFBvaW50aW5nIERldmljZQoJVHlwZTogVG91Y2ggUGFkCglJ
bnRlcmZhY2U6IFBTLzIKCUJ1dHRvbnM6IDQKCkhhbmRsZSAweDAwMEYsIERNSSB0eXBlIDI3LCAx
NSBieXRlcwpDb29saW5nIERldmljZQoJVHlwZTogRmFuCglTdGF0dXM6IE9LCglPRU0tc3BlY2lm
aWMgSW5mb3JtYXRpb246IDB4MDAwMDAwMDAKCU5vbWluYWwgU3BlZWQ6IDIwMDAgcnBtCgpIYW5k
bGUgMHgwMDEwLCBETUkgdHlwZSAzMiwgMjAgYnl0ZXMKU3lzdGVtIEJvb3QgSW5mb3JtYXRpb24K
CVN0YXR1czogTm8gZXJyb3JzIGRldGVjdGVkCgpIYW5kbGUgMHgwMDExLCBETUkgdHlwZSAzOSwg
MjIgYnl0ZXMKU3lzdGVtIFBvd2VyIFN1cHBseQoJTG9jYXRpb246IE9FTV9EZWZpbmUwCglOYW1l
OiBPRU1fRGVmaW5lMQoJTWFudWZhY3R1cmVyOiBPRU1fRGVmaW5lMgoJU2VyaWFsIE51bWJlcjog
T0VNX0RlZmluZTMKCUFzc2V0IFRhZzogT0VNX0RlZmluZTQKCU1vZGVsIFBhcnQgTnVtYmVyOiBP
RU1fRGVmaW5lNQoJUmV2aXNpb246IE9FTV9EZWZpbmU2CglNYXggUG93ZXIgQ2FwYWNpdHk6IDAu
MDc1IFcKCVN0YXR1czogUHJlc2VudCwgT0sKCVR5cGU6IFJlZ3VsYXRvcgoJSW5wdXQgVm9sdGFn
ZSBSYW5nZSBTd2l0Y2hpbmc6IEF1dG8tc3dpdGNoCglQbHVnZ2VkOiBObwoJSG90IFJlcGxhY2Vh
YmxlOiBObwoJQ29vbGluZyBEZXZpY2UgSGFuZGxlOiAweDAwMEYKCkhhbmRsZSAweDAwMTIsIERN
SSB0eXBlIDQwLCAxOCBieXRlcwpVbmtub3duIFR5cGUKCUhlYWRlciBhbmQgRGF0YToKCQkyOCAx
MiAxMiAwMCAwMiAwNiAwNCAwMCAwNSAwMSBBQSAwNyAwMCAwMCAwNSAwMgoJCURDIDA1CglTdHJp
bmdzOgoJCVBDSUV4cHJlc3N4MTYKCQlDb21waWxlciBWZXJzaW9uOiBWQyA5LjAKCkhhbmRsZSAw
eDAwMTMsIERNSSB0eXBlIDQxLCAxMSBieXRlcwpVbmtub3duIFR5cGUKCUhlYWRlciBhbmQgRGF0
YToKCQkyOSAwQiAxMyAwMCAwMSA4NSAwMSAwMCAwMCAwMCAwMQoJU3RyaW5nczoKCQlIYW5rc3Zp
bGxlIEdiZSBMYW4gQ29ubmVjdGlvbgoKSGFuZGxlIDB4MDAxNCwgRE1JIHR5cGUgMjIsIDI2IGJ5
dGVzClBvcnRhYmxlIEJhdHRlcnkKCUxvY2F0aW9uOiBGYWtlCglNYW51ZmFjdHVyZXI6IC1WaXJ0
dWFsIEJhdHRlcnkgMC0KCU1hbnVmYWN0dXJlIERhdGU6IDEwLzEyLzIwMDcKCVNlcmlhbCBOdW1i
ZXI6IEJhdHRlcnkgMAoJTmFtZTogQ1JCIEJhdHRlcnkgMAoJQ2hlbWlzdHJ5OiBMaXRoaXVtIElv
bgoJRGVzaWduIENhcGFjaXR5OiBVbmtub3duCglEZXNpZ24gVm9sdGFnZTogVW5rbm93bgoJU0JE
UyBWZXJzaW9uOiBOb3QgU3BlY2lmaWVkCglNYXhpbXVtIEVycm9yOiBVbmtub3duCglPRU0tc3Bl
Y2lmaWMgSW5mb3JtYXRpb246IDB4MDAwMDAwMDAKCkhhbmRsZSAweDAwMTUsIERNSSB0eXBlIDEz
NiwgNiBieXRlcwpPRU0tc3BlY2lmaWMgVHlwZQoJSGVhZGVyIGFuZCBEYXRhOgoJCTg4IDA2IDE1
IDAwIDVBIDVBCgpIYW5kbGUgMHgwMDE2LCBETUkgdHlwZSAxMjksIDggYnl0ZXMKT0VNLXNwZWNp
ZmljIFR5cGUKCUhlYWRlciBhbmQgRGF0YToKCQk4MSAwOCAxNiAwMCAwMSAwMSAwMiAwMQoJU3Ry
aW5nczoKCQlJbnRlbF9BU0YKCQlJbnRlbF9BU0ZfMDAxCgpIYW5kbGUgMHgwMDE3LCBETUkgdHlw
ZSAxMzAsIDIwIGJ5dGVzCk9FTS1zcGVjaWZpYyBUeXBlCglIZWFkZXIgYW5kIERhdGE6CgkJODIg
MTQgMTcgMDAgMjQgNDEgNEQgNTQgMDEgMDEgMDEgMDEgMDEgQTUgMUYgMDIKCQkwMCAwMCAwMCAw
MAoKSGFuZGxlIDB4MDAxOCwgRE1JIHR5cGUgMTYsIDIzIGJ5dGVzClBoeXNpY2FsIE1lbW9yeSBB
cnJheQoJTG9jYXRpb246IFN5c3RlbSBCb2FyZCBPciBNb3RoZXJib2FyZAoJVXNlOiBTeXN0ZW0g
TWVtb3J5CglFcnJvciBDb3JyZWN0aW9uIFR5cGU6IE5vbmUKCU1heGltdW0gQ2FwYWNpdHk6IDE2
IEdCCglFcnJvciBJbmZvcm1hdGlvbiBIYW5kbGU6IE5vIEVycm9yCglOdW1iZXIgT2YgRGV2aWNl
czogMgoKSGFuZGxlIDB4MDAxOSwgRE1JIHR5cGUgMTcsIDM0IGJ5dGVzCk1lbW9yeSBEZXZpY2UK
CUFycmF5IEhhbmRsZTogMHgwMDE4CglFcnJvciBJbmZvcm1hdGlvbiBIYW5kbGU6IDB4MDAxQgoJ
VG90YWwgV2lkdGg6IDY0IGJpdHMKCURhdGEgV2lkdGg6IDY0IGJpdHMKCVNpemU6IDEwMjQgTUIK
CUZvcm0gRmFjdG9yOiBTT0RJTU0KCVNldDogTm9uZQoJTG9jYXRvcjogRElNTTAKCUJhbmsgTG9j
YXRvcjogQkFOSyAwCglUeXBlOiA8T1VUIE9GIFNQRUM+CglUeXBlIERldGFpbDogU3luY2hyb25v
dXMKCVNwZWVkOiAxMDY3IE1IeiAoMC45IG5zKQoJTWFudWZhY3R1cmVyOiBOb3QgU3BlY2lmaWVk
CglTZXJpYWwgTnVtYmVyOiBFRDAxNTQxMwoJQXNzZXQgVGFnOiBVbmtub3duCglQYXJ0IE51bWJl
cjogTlQxR0M2NEJINEIwUFMtQ0cgCgpIYW5kbGUgMHgwMDFBLCBETUkgdHlwZSA2LCAxMiBieXRl
cwpNZW1vcnkgTW9kdWxlIEluZm9ybWF0aW9uCglTb2NrZXQgRGVzaWduYXRpb246IERJTU0wCglC
YW5rIENvbm5lY3Rpb25zOiBOb25lCglDdXJyZW50IFNwZWVkOiBVbmtub3duCglUeXBlOiBESU1N
CglJbnN0YWxsZWQgU2l6ZTogMTAyNCBNQiAoU2luZ2xlLWJhbmsgQ29ubmVjdGlvbikKCUVuYWJs
ZWQgU2l6ZTogMTAyNCBNQiAoU2luZ2xlLWJhbmsgQ29ubmVjdGlvbikKCUVycm9yIFN0YXR1czog
T0sKCkhhbmRsZSAweDAwMUIsIERNSSB0eXBlIDE4LCAyMyBieXRlcwozMi1iaXQgTWVtb3J5IEVy
cm9yIEluZm9ybWF0aW9uCglUeXBlOiBPSwoJR3JhbnVsYXJpdHk6IFVua25vd24KCU9wZXJhdGlv
bjogVW5rbm93bgoJVmVuZG9yIFN5bmRyb21lOiBVbmtub3duCglNZW1vcnkgQXJyYXkgQWRkcmVz
czogVW5rbm93bgoJRGV2aWNlIEFkZHJlc3M6IFVua25vd24KCVJlc29sdXRpb246IFVua25vd24K
CkhhbmRsZSAweDAwMUMsIERNSSB0eXBlIDIwLCAzNSBieXRlcwpNZW1vcnkgRGV2aWNlIE1hcHBl
ZCBBZGRyZXNzCglTdGFydGluZyBBZGRyZXNzOiAweDAwMDAwMDAwMDAwCglFbmRpbmcgQWRkcmVz
czogMHgwMDAzRkZGRkZGRgoJUmFuZ2UgU2l6ZTogMSBHQgoJUGh5c2ljYWwgRGV2aWNlIEhhbmRs
ZTogMHgwMDE5CglNZW1vcnkgQXJyYXkgTWFwcGVkIEFkZHJlc3MgSGFuZGxlOiAweDAwMjgKCVBh
cnRpdGlvbiBSb3cgUG9zaXRpb246IFVua25vd24KCUludGVybGVhdmUgUG9zaXRpb246IDEKCUlu
dGVybGVhdmVkIERhdGEgRGVwdGg6IDEKCkhhbmRsZSAweDAwMUQsIERNSSB0eXBlIDE3LCAzNCBi
eXRlcwpNZW1vcnkgRGV2aWNlCglBcnJheSBIYW5kbGU6IDB4MDAxOAoJRXJyb3IgSW5mb3JtYXRp
b24gSGFuZGxlOiBOb3QgUHJvdmlkZWQKCVRvdGFsIFdpZHRoOiA4IGJpdHMKCURhdGEgV2lkdGg6
IDggYml0cwoJU2l6ZTogTm8gTW9kdWxlIEluc3RhbGxlZAoJRm9ybSBGYWN0b3I6IERJTU0KCVNl
dDogTm9uZQoJTG9jYXRvcjogRElNTTEKCUJhbmsgTG9jYXRvcjogQkFOSyAxCglUeXBlOiA8T1VU
IE9GIFNQRUM+CglUeXBlIERldGFpbDogU3luY2hyb25vdXMKCVNwZWVkOiAxMDY3IE1IeiAoMC45
IG5zKQoJTWFudWZhY3R1cmVyOiBOb3QgU3BlY2lmaWVkCglTZXJpYWwgTnVtYmVyOiAwMDAwMDAw
MAoJQXNzZXQgVGFnOiBVbmtub3duCglQYXJ0IE51bWJlcjogTm90IFNwZWNpZmllZAoKSGFuZGxl
IDB4MDAxRSwgRE1JIHR5cGUgNiwgMTIgYnl0ZXMKTWVtb3J5IE1vZHVsZSBJbmZvcm1hdGlvbgoJ
U29ja2V0IERlc2lnbmF0aW9uOiBESU1NMQoJQmFuayBDb25uZWN0aW9uczogTm9uZQoJQ3VycmVu
dCBTcGVlZDogVW5rbm93bgoJVHlwZTogRElNTQoJSW5zdGFsbGVkIFNpemU6IE5vdCBJbnN0YWxs
ZWQKCUVuYWJsZWQgU2l6ZTogTm90IEluc3RhbGxlZAoJRXJyb3IgU3RhdHVzOiBPSwoKSGFuZGxl
IDB4MDAxRiwgRE1JIHR5cGUgMTgsIDIzIGJ5dGVzCjMyLWJpdCBNZW1vcnkgRXJyb3IgSW5mb3Jt
YXRpb24KCVR5cGU6IE9LCglHcmFudWxhcml0eTogVW5rbm93bgoJT3BlcmF0aW9uOiBVbmtub3du
CglWZW5kb3IgU3luZHJvbWU6IFVua25vd24KCU1lbW9yeSBBcnJheSBBZGRyZXNzOiBVbmtub3du
CglEZXZpY2UgQWRkcmVzczogVW5rbm93bgoJUmVzb2x1dGlvbjogVW5rbm93bgoKSGFuZGxlIDB4
MDAyMCwgRE1JIHR5cGUgMTcsIDM0IGJ5dGVzCk1lbW9yeSBEZXZpY2UKCUFycmF5IEhhbmRsZTog
MHgwMDE4CglFcnJvciBJbmZvcm1hdGlvbiBIYW5kbGU6IDB4MDAyMgoJVG90YWwgV2lkdGg6IDY0
IGJpdHMKCURhdGEgV2lkdGg6IDY0IGJpdHMKCVNpemU6IDEwMjQgTUIKCUZvcm0gRmFjdG9yOiBT
T0RJTU0KCVNldDogTm9uZQoJTG9jYXRvcjogRElNTTEKCUJhbmsgTG9jYXRvcjogQkFOSyAyCglU
eXBlOiA8T1VUIE9GIFNQRUM+CglUeXBlIERldGFpbDogU3luY2hyb25vdXMKCVNwZWVkOiAxMDY3
IE1IeiAoMC45IG5zKQoJTWFudWZhY3R1cmVyOiBOb3QgU3BlY2lmaWVkCglTZXJpYWwgTnVtYmVy
OiBBQjQwRDQxQQoJQXNzZXQgVGFnOiBVbmtub3duCglQYXJ0IE51bWJlcjogTlQxR0M2NEJINEIw
UFMtQ0cgCgpIYW5kbGUgMHgwMDIxLCBETUkgdHlwZSA2LCAxMiBieXRlcwpNZW1vcnkgTW9kdWxl
IEluZm9ybWF0aW9uCglTb2NrZXQgRGVzaWduYXRpb246IERJTU0xCglCYW5rIENvbm5lY3Rpb25z
OiBOb25lCglDdXJyZW50IFNwZWVkOiBVbmtub3duCglUeXBlOiBESU1NCglJbnN0YWxsZWQgU2l6
ZTogMTAyNCBNQiAoU2luZ2xlLWJhbmsgQ29ubmVjdGlvbikKCUVuYWJsZWQgU2l6ZTogMTAyNCBN
QiAoU2luZ2xlLWJhbmsgQ29ubmVjdGlvbikKCUVycm9yIFN0YXR1czogT0sKCkhhbmRsZSAweDAw
MjIsIERNSSB0eXBlIDE4LCAyMyBieXRlcwozMi1iaXQgTWVtb3J5IEVycm9yIEluZm9ybWF0aW9u
CglUeXBlOiBPSwoJR3JhbnVsYXJpdHk6IFVua25vd24KCU9wZXJhdGlvbjogVW5rbm93bgoJVmVu
ZG9yIFN5bmRyb21lOiBVbmtub3duCglNZW1vcnkgQXJyYXkgQWRkcmVzczogVW5rbm93bgoJRGV2
aWNlIEFkZHJlc3M6IFVua25vd24KCVJlc29sdXRpb246IFVua25vd24KCkhhbmRsZSAweDAwMjMs
IERNSSB0eXBlIDIwLCAzNSBieXRlcwpNZW1vcnkgRGV2aWNlIE1hcHBlZCBBZGRyZXNzCglTdGFy
dGluZyBBZGRyZXNzOiAweDAwMDAwMDAwMDAwCglFbmRpbmcgQWRkcmVzczogMHgwMDAzRkZGRkZG
RgoJUmFuZ2UgU2l6ZTogMSBHQgoJUGh5c2ljYWwgRGV2aWNlIEhhbmRsZTogMHgwMDIwCglNZW1v
cnkgQXJyYXkgTWFwcGVkIEFkZHJlc3MgSGFuZGxlOiAweDAwMjgKCVBhcnRpdGlvbiBSb3cgUG9z
aXRpb246IFVua25vd24KCUludGVybGVhdmUgUG9zaXRpb246IDIKCUludGVybGVhdmVkIERhdGEg
RGVwdGg6IDEKCkhhbmRsZSAweDAwMjQsIERNSSB0eXBlIDE3LCAzNCBieXRlcwpNZW1vcnkgRGV2
aWNlCglBcnJheSBIYW5kbGU6IDB4MDAxOAoJRXJyb3IgSW5mb3JtYXRpb24gSGFuZGxlOiBOb3Qg
UHJvdmlkZWQKCVRvdGFsIFdpZHRoOiA4IGJpdHMKCURhdGEgV2lkdGg6IDggYml0cwoJU2l6ZTog
Tm8gTW9kdWxlIEluc3RhbGxlZAoJRm9ybSBGYWN0b3I6IERJTU0KCVNldDogTm9uZQoJTG9jYXRv
cjogRElNTTMKCUJhbmsgTG9jYXRvcjogQkFOSyAzCglUeXBlOiA8T1VUIE9GIFNQRUM+CglUeXBl
IERldGFpbDogU3luY2hyb25vdXMKCVNwZWVkOiAxMDY3IE1IeiAoMC45IG5zKQoJTWFudWZhY3R1
cmVyOiBOb3QgU3BlY2lmaWVkCglTZXJpYWwgTnVtYmVyOiAwMDAwMDAwMAoJQXNzZXQgVGFnOiBV
bmtub3duCglQYXJ0IE51bWJlcjogTm90IFNwZWNpZmllZAoKSGFuZGxlIDB4MDAyNSwgRE1JIHR5
cGUgNiwgMTIgYnl0ZXMKTWVtb3J5IE1vZHVsZSBJbmZvcm1hdGlvbgoJU29ja2V0IERlc2lnbmF0
aW9uOiBESU1NMwoJQmFuayBDb25uZWN0aW9uczogTm9uZQoJQ3VycmVudCBTcGVlZDogVW5rbm93
bgoJVHlwZTogRElNTQoJSW5zdGFsbGVkIFNpemU6IE5vdCBJbnN0YWxsZWQKCUVuYWJsZWQgU2l6
ZTogTm90IEluc3RhbGxlZAoJRXJyb3IgU3RhdHVzOiBPSwoKSGFuZGxlIDB4MDAyNiwgRE1JIHR5
cGUgMTgsIDIzIGJ5dGVzCjMyLWJpdCBNZW1vcnkgRXJyb3IgSW5mb3JtYXRpb24KCVR5cGU6IE9L
CglHcmFudWxhcml0eTogVW5rbm93bgoJT3BlcmF0aW9uOiBVbmtub3duCglWZW5kb3IgU3luZHJv
bWU6IFVua25vd24KCU1lbW9yeSBBcnJheSBBZGRyZXNzOiBVbmtub3duCglEZXZpY2UgQWRkcmVz
czogVW5rbm93bgoJUmVzb2x1dGlvbjogVW5rbm93bgoKSGFuZGxlIDB4MDAyNywgRE1JIHR5cGUg
MTgsIDIzIGJ5dGVzCjMyLWJpdCBNZW1vcnkgRXJyb3IgSW5mb3JtYXRpb24KCVR5cGU6IE9LCglH
cmFudWxhcml0eTogVW5rbm93bgoJT3BlcmF0aW9uOiBVbmtub3duCglWZW5kb3IgU3luZHJvbWU6
IFVua25vd24KCU1lbW9yeSBBcnJheSBBZGRyZXNzOiBVbmtub3duCglEZXZpY2UgQWRkcmVzczog
VW5rbm93bgoJUmVzb2x1dGlvbjogVW5rbm93bgoKSGFuZGxlIDB4MDAyOCwgRE1JIHR5cGUgMTks
IDMxIGJ5dGVzCk1lbW9yeSBBcnJheSBNYXBwZWQgQWRkcmVzcwoJU3RhcnRpbmcgQWRkcmVzczog
MHgwMDAwMDAwMDAwMAoJRW5kaW5nIEFkZHJlc3M6IDB4MDAwN0ZGRkZGRkYKCVJhbmdlIFNpemU6
IDIgR0IKCVBoeXNpY2FsIEFycmF5IEhhbmRsZTogMHgwMDE4CglQYXJ0aXRpb24gV2lkdGg6IDAK
CkhhbmRsZSAweDAwMjksIERNSSB0eXBlIDUsIDIwIGJ5dGVzCk1lbW9yeSBDb250cm9sbGVyIElu
Zm9ybWF0aW9uCglFcnJvciBEZXRlY3RpbmcgTWV0aG9kOiBOb25lCglFcnJvciBDb3JyZWN0aW5n
IENhcGFiaWxpdGllczoKCQlVbmtub3duCgkJTm9uZQoJU3VwcG9ydGVkIEludGVybGVhdmU6IE9u
ZS13YXkgSW50ZXJsZWF2ZQoJQ3VycmVudCBJbnRlcmxlYXZlOiBPbmUtd2F5IEludGVybGVhdmUK
CU1heGltdW0gTWVtb3J5IE1vZHVsZSBTaXplOiA4MTkyIE1CCglNYXhpbXVtIFRvdGFsIE1lbW9y
eSBTaXplOiAxNjM4NCBNQgoJU3VwcG9ydGVkIFNwZWVkczoKCQlPdGhlcgoJU3VwcG9ydGVkIE1l
bW9yeSBUeXBlczoKCQlPdGhlcgoJTWVtb3J5IE1vZHVsZSBWb2x0YWdlOiBVbmtub3duCglBc3Nv
Y2lhdGVkIE1lbW9yeSBTbG90czogMgoJCTB4MDAxQQoJCTB4MDAyMQoJRW5hYmxlZCBFcnJvciBD
b3JyZWN0aW5nIENhcGFiaWxpdGllczoKCQlOb25lCgpIYW5kbGUgMHgwMDJBLCBETUkgdHlwZSA0
LCA0MiBieXRlcwpQcm9jZXNzb3IgSW5mb3JtYXRpb24KCVNvY2tldCBEZXNpZ25hdGlvbjogQ1BV
CglUeXBlOiBDZW50cmFsIFByb2Nlc3NvcgoJRmFtaWx5OiA8T1VUIE9GIFNQRUM+CglNYW51ZmFj
dHVyZXI6IEludGVsKFIpIENvcnBvcmF0aW9uCglJRDogNTUgMDYgMDIgMDAgRkYgRkIgRUIgQkYK
CVZlcnNpb246IEludGVsKFIpIFBlbnRpdW0oUikgQ1BVICAgICAgICBQNjIwMCAgQCAyLjEzR0h6
CglWb2x0YWdlOiAwLjAgVgoJRXh0ZXJuYWwgQ2xvY2s6IDEwNjYgTUh6CglNYXggU3BlZWQ6IDIx
MzMgTUh6CglDdXJyZW50IFNwZWVkOiAyMTMxIE1IegoJU3RhdHVzOiBQb3B1bGF0ZWQsIEVuYWJs
ZWQKCVVwZ3JhZGU6IFpJRiBTb2NrZXQKCUwxIENhY2hlIEhhbmRsZTogMHgwMDJFCglMMiBDYWNo
ZSBIYW5kbGU6IDB4MDAyRAoJTDMgQ2FjaGUgSGFuZGxlOiAweDAwMkIKCVNlcmlhbCBOdW1iZXI6
IE5vdCBTcGVjaWZpZWQKCUFzc2V0IFRhZzogRkZGRgoJUGFydCBOdW1iZXI6IE5vdCBTcGVjaWZp
ZWQKCUNvcmUgQ291bnQ6IDIKCUNvcmUgRW5hYmxlZDogMgoJVGhyZWFkIENvdW50OiAyCglDaGFy
YWN0ZXJpc3RpY3M6CgkJNjQtYml0IGNhcGFibGUKCkhhbmRsZSAweDAwMkIsIERNSSB0eXBlIDcs
IDE5IGJ5dGVzCkNhY2hlIEluZm9ybWF0aW9uCglTb2NrZXQgRGVzaWduYXRpb246IEwzIENhY2hl
CglDb25maWd1cmF0aW9uOiBFbmFibGVkLCBOb3QgU29ja2V0ZWQsIExldmVsIDMKCU9wZXJhdGlv
bmFsIE1vZGU6IFdyaXRlIFRocm91Z2gKCUxvY2F0aW9uOiBJbnRlcm5hbAoJSW5zdGFsbGVkIFNp
emU6IDMwNzIgS0IKCU1heGltdW0gU2l6ZTogMzA3MiBLQgoJU3VwcG9ydGVkIFNSQU0gVHlwZXM6
CgkJU3luY2hyb25vdXMKCUluc3RhbGxlZCBTUkFNIFR5cGU6IFN5bmNocm9ub3VzCglTcGVlZDog
VW5rbm93bgoJRXJyb3IgQ29ycmVjdGlvbiBUeXBlOiBTaW5nbGUtYml0IEVDQwoJU3lzdGVtIFR5
cGU6IFVuaWZpZWQKCUFzc29jaWF0aXZpdHk6IE90aGVyCgpIYW5kbGUgMHgwMDJDLCBETUkgdHlw
ZSA3LCAxOSBieXRlcwpDYWNoZSBJbmZvcm1hdGlvbgoJU29ja2V0IERlc2lnbmF0aW9uOiBMMSBD
YWNoZQoJQ29uZmlndXJhdGlvbjogRW5hYmxlZCwgTm90IFNvY2tldGVkLCBMZXZlbCAxCglPcGVy
YXRpb25hbCBNb2RlOiBXcml0ZSBUaHJvdWdoCglMb2NhdGlvbjogSW50ZXJuYWwKCUluc3RhbGxl
ZCBTaXplOiAzMiBLQgoJTWF4aW11bSBTaXplOiAzMiBLQgoJU3VwcG9ydGVkIFNSQU0gVHlwZXM6
CgkJU3luY2hyb25vdXMKCUluc3RhbGxlZCBTUkFNIFR5cGU6IFN5bmNocm9ub3VzCglTcGVlZDog
VW5rbm93bgoJRXJyb3IgQ29ycmVjdGlvbiBUeXBlOiBTaW5nbGUtYml0IEVDQwoJU3lzdGVtIFR5
cGU6IERhdGEKCUFzc29jaWF0aXZpdHk6IDgtd2F5IFNldC1hc3NvY2lhdGl2ZQoKSGFuZGxlIDB4
MDAyRCwgRE1JIHR5cGUgNywgMTkgYnl0ZXMKQ2FjaGUgSW5mb3JtYXRpb24KCVNvY2tldCBEZXNp
Z25hdGlvbjogTDIgQ2FjaGUKCUNvbmZpZ3VyYXRpb246IEVuYWJsZWQsIE5vdCBTb2NrZXRlZCwg
TGV2ZWwgMgoJT3BlcmF0aW9uYWwgTW9kZTogV3JpdGUgVGhyb3VnaAoJTG9jYXRpb246IEludGVy
bmFsCglJbnN0YWxsZWQgU2l6ZTogMjU2IEtCCglNYXhpbXVtIFNpemU6IDI1NiBLQgoJU3VwcG9y
dGVkIFNSQU0gVHlwZXM6CgkJU3luY2hyb25vdXMKCUluc3RhbGxlZCBTUkFNIFR5cGU6IFN5bmNo
cm9ub3VzCglTcGVlZDogVW5rbm93bgoJRXJyb3IgQ29ycmVjdGlvbiBUeXBlOiBTaW5nbGUtYml0
IEVDQwoJU3lzdGVtIFR5cGU6IFVuaWZpZWQKCUFzc29jaWF0aXZpdHk6IDgtd2F5IFNldC1hc3Nv
Y2lhdGl2ZQoKSGFuZGxlIDB4MDAyRSwgRE1JIHR5cGUgNywgMTkgYnl0ZXMKQ2FjaGUgSW5mb3Jt
YXRpb24KCVNvY2tldCBEZXNpZ25hdGlvbjogTDEgQ2FjaGUKCUNvbmZpZ3VyYXRpb246IEVuYWJs
ZWQsIE5vdCBTb2NrZXRlZCwgTGV2ZWwgMQoJT3BlcmF0aW9uYWwgTW9kZTogV3JpdGUgVGhyb3Vn
aAoJTG9jYXRpb246IEludGVybmFsCglJbnN0YWxsZWQgU2l6ZTogMzIgS0IKCU1heGltdW0gU2l6
ZTogMzIgS0IKCVN1cHBvcnRlZCBTUkFNIFR5cGVzOgoJCVN5bmNocm9ub3VzCglJbnN0YWxsZWQg
U1JBTSBUeXBlOiBTeW5jaHJvbm91cwoJU3BlZWQ6IFVua25vd24KCUVycm9yIENvcnJlY3Rpb24g
VHlwZTogU2luZ2xlLWJpdCBFQ0MKCVN5c3RlbSBUeXBlOiBJbnN0cnVjdGlvbgoJQXNzb2NpYXRp
dml0eTogNC13YXkgU2V0LWFzc29jaWF0aXZlCgpIYW5kbGUgMHgwMDJGLCBETUkgdHlwZSAxNzAs
IDEwNiBieXRlcwpPRU0tc3BlY2lmaWMgVHlwZQoJSGVhZGVyIGFuZCBEYXRhOgoJCUFBIDZBIDJG
IDAwIDAxIDAwIDAwIDAwIDdGIDAwIDBGIDAwIDA2IDAwIDAxIDAyCgkJMDEgMDAgNDEgMDIgMDQg
MDAgNDIgMDIgMDggMDAgNDMgMDIgMTAgMDAgNDQgMDIKCQkyMCAwMCA0NSAwMiA0MCAwMCA0NiAw
MiAwMSAwMCA0NyAwMiAwMiAwMCA2MSAwMgoJCTA4IDAwIDYyIDAyIDA0IDAwIDYzIDAyIDAxIDAw
IDY0IDAyIDAyIDAwIDgxIDAyCgkJMDQgMDAgODIgMDIgMDIgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAKCQkwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMAoJCTAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCgpIYW5kbGUgMHgwMDMwLCBETUkg
dHlwZSAxNzEsIDI0IGJ5dGVzCk9FTS1zcGVjaWZpYyBUeXBlCglIZWFkZXIgYW5kIERhdGE6CgkJ
QUIgMTggMzAgMDAgMDIgNjkgMTkgNjIgMjAgMDQgMDIgMDQgNzUgNzYgMDUgODYKCQk4MCA1NiAz
QiAwNyA4QyAxNiAzMiAwMAoKSGFuZGxlIDB4MDAzMSwgRE1JIHR5cGUgMTcyLCA2IGJ5dGVzCk9F
TS1zcGVjaWZpYyBUeXBlCglIZWFkZXIgYW5kIERhdGE6CgkJQUMgMDYgMzEgMDAgMDIgMDQKCkhh
bmRsZSAweDAwMzIsIERNSSB0eXBlIDEyNywgNCBieXRlcwpFbmQgT2YgVGFibGUKCg==
--0016e649bcf6faf82c04ac5339c5--
