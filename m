From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-laptop: support Synaptics/Alps touchpad led
Date: Tue, 4 Oct 2011 16:25:44 +0800
Message-ID: <CAMz9Wg__EA02WBjoamO148a-4Vkyw7cZBYOEsJEVKbFJtO5MjA@mail.gmail.com>
References: <1317706110-7199-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=00163630f90b76c63004ae74d6af
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:65262 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754289Ab1JDIZq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 Oct 2011 04:25:46 -0400
Received: by qyk7 with SMTP id 7so143894qyk.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Oct 2011 01:25:45 -0700 (PDT)
In-Reply-To: <1317706110-7199-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

--00163630f90b76c63004ae74d6af
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry, I forgot to checkout the format.
Please review the new one in this email.
Thanks.

2011/10/4 AceLan Kao <acelan.kao@canonical.com>:
> This patch supports Dell laptop with Synaptics and Alps touchpad chip
> that with LED to indicate the functionality of touchpad is disabled or
> enabled.
>
> The command for touchpad LED is 0x97, and the data 1 means turn on the
> touchpad LED, 2 means turn it off.
>
> BTW, I add dell_quirks to white list those machines that supports this
> behavior, so that the code won't affect those who don't have a touchpad L=
ED
> machine.
>
> We can easily to turn it on/off by
> =A0 echo 1 > /sys/class/leds/dell-laptop::touchpad/brightness
> =A0 echo 0 > /sys/class/leds/dell-laptop::touchpad/brightness
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =A0drivers/platform/x86/dell-laptop.c | =A0 82 ++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 82 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index f31fa4e..e40da74 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -60,6 +60,22 @@ struct calling_interface_structure {
> =A0 =A0 =A0 =A0struct calling_interface_token tokens[];
> =A0} __packed;
>
> +struct quirk_entry {
> + =A0 =A0 =A0 u8 touchpad_led;
> +};
> +
> +static struct quirk_entry *quirks;
> +
> +static struct quirk_entry quirk_dell_vostro_v130=3D {
> + =A0 =A0 =A0 .touchpad_led=3D 1,
> +};
> +
> +static int dmi_matched(const struct dmi_system_id *dmi)
> +{
> + =A0 =A0 =A0 quirks =3D dmi->driver_data;
> + =A0 =A0 =A0 return 1;
> +}
> +
> =A0static int da_command_address;
> =A0static int da_command_code;
> =A0static int da_num_tokens;
> @@ -149,6 +165,27 @@ static struct dmi_system_id __devinitdata dell_black=
list[] =3D {
> =A0 =A0 =A0 =A0{}
> =A0};
>
> +static struct dmi_system_id __devinitdata dell_quirks[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "Dell Vostro V130",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VENDOR, "=
Dell Inc."),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_NAME,=
 "Vostro V130"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_dell_vostro_v130,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "Dell Vostro V131",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VENDOR, "=
Dell Inc."),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_NAME,=
 "Vostro V131"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_dell_vostro_v130,
> + =A0 =A0 =A0 },
> +};
> +
> =A0static struct calling_interface_buffer *buffer;
> =A0static struct page *bufferpage;
> =A0static DEFINE_MUTEX(buffer_mutex);
> @@ -552,6 +589,44 @@ static const struct backlight_ops dell_ops =3D {
> =A0 =A0 =A0 =A0.update_status =A0=3D dell_send_intensity,
> =A0};
>
> +static void touchpad_led_on()
> +{
> + =A0 =A0 =A0 int command=3D 0x97;
> + =A0 =A0 =A0 char data=3D 1;
> + =A0 =A0 =A0 i8042_command ( &data, command | 1 << 12);
> +}
> +
> +static void touchpad_led_off()
> +{
> + =A0 =A0 =A0 int command=3D 0x97;
> + =A0 =A0 =A0 char data=3D 2;
> + =A0 =A0 =A0 i8042_command ( &data, command | 1 << 12);
> +}
> +
> +static void touchpad_led_set(struct led_classdev *led_cdev,
> + =A0 =A0 =A0 enum led_brightness value)
> +{
> + =A0 =A0 =A0 if (value > 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touchpad_led_on();
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touchpad_led_off();
> +}
> +
> +static struct led_classdev touchpad_led =3D {
> + =A0 =A0 =A0 .name =3D "dell-laptop::touchpad",
> + =A0 =A0 =A0 .brightness_set =3D touchpad_led_set,
> +};
> +
> +static int __devinit touchpad_led_init(struct device *dev)
> +{
> + =A0 =A0 =A0 return led_classdev_register(dev, &touchpad_led);
> +}
> +
> +static void touchpad_led_exit(void)
> +{
> + =A0 =A0 =A0 led_classdev_unregister(&touchpad_led);
> +}
> +
> =A0static bool dell_laptop_i8042_filter(unsigned char data, unsigned char=
 str,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct serio *=
port)
> =A0{
> @@ -584,6 +659,9 @@ static int __init dell_init(void)
> =A0 =A0 =A0 =A0if (!dmi_check_system(dell_device_table))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
>
> + =A0 =A0 =A0 quirks =3D NULL;
> + =A0 =A0 =A0 dmi_check_system(dell_quirks); /* find if this machine supp=
ort other functions */
> +
> =A0 =A0 =A0 =A0dmi_walk(find_tokens, NULL);
>
> =A0 =A0 =A0 =A0if (!da_tokens) =A0{
> @@ -626,6 +704,9 @@ static int __init dell_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_filter;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 if(quirks && quirks->touchpad_led)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touchpad_led_init(&platform_device->dev);
> +
> =A0 =A0 =A0 =A0dell_laptop_dir =3D debugfs_create_dir("dell_laptop", NULL=
);
> =A0 =A0 =A0 =A0if (dell_laptop_dir !=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debugfs_create_file("rfkill", 0444, dell_l=
aptop_dir, NULL,
> @@ -692,6 +773,7 @@ fail_platform_driver:
> =A0static void __exit dell_exit(void)
> =A0{
> =A0 =A0 =A0 =A0debugfs_remove_recursive(dell_laptop_dir);
> + =A0 =A0 =A0 touchpad_led_exit();
> =A0 =A0 =A0 =A0i8042_remove_filter(dell_laptop_i8042_filter);
> =A0 =A0 =A0 =A0cancel_delayed_work_sync(&dell_rfkill_work);
> =A0 =A0 =A0 =A0backlight_device_unregister(dell_backlight_device);
> --
> 1.7.5.4
>
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

--00163630f90b76c63004ae74d6af
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-dell-laptop-support-Synaptics-Alps-touchpad-led.patch"
Content-Disposition: attachment;
	filename="0001-dell-laptop-support-Synaptics-Alps-touchpad-led.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gtcmi5220

RnJvbSAwODg4MTcyZjlkMWNiMzc5MzQzZDJlM2UzNzgzZjRmODNiYTg2ZjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBY2VMYW4gS2FvIDxhY2VsYW4ua2FvQGNhbm9uaWNhbC5jb20+
CkRhdGU6IFR1ZSwgNCBPY3QgMjAxMSAxNjoyNDowNiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
bGwtbGFwdG9wOiBzdXBwb3J0IFN5bmFwdGljcy9BbHBzIHRvdWNocGFkIGxlZAoKVGhpcyBwYXRj
aCBzdXBwb3J0cyBEZWxsIGxhcHRvcCB3aXRoIFN5bmFwdGljcyBhbmQgQWxwcyB0b3VjaHBhZCBj
aGlwCnRoYXQgd2l0aCBMRUQgdG8gaW5kaWNhdGUgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdG91Y2hw
YWQgaXMgZGlzYWJsZWQgb3IKZW5hYmxlZC4KClRoZSBjb21tYW5kIGZvciB0b3VjaHBhZCBMRUQg
aXMgMHg5NywgYW5kIHRoZSBkYXRhIDEgbWVhbnMgdHVybiBvbiB0aGUKdG91Y2hwYWQgTEVELCAy
IG1lYW5zIHR1cm4gaXQgb2ZmLgoKQlRXLCBJIGFkZCBkZWxsX3F1aXJrcyB0byB3aGl0ZSBsaXN0
IHRob3NlIG1hY2hpbmVzIHRoYXQgc3VwcG9ydHMgdGhpcwpiZWhhdmlvciwgc28gdGhhdCB0aGUg
Y29kZSB3b24ndCBhZmZlY3QgdGhvc2Ugd2hvIGRvbid0IGhhdmUgYSB0b3VjaHBhZCBMRUQKbWFj
aGluZS4KCldlIGNhbiBlYXNpbHkgdG8gdHVybiBpdCBvbi9vZmYgYnkKICAgZWNobyAxID4gL3N5
cy9jbGFzcy9sZWRzL2RlbGwtbGFwdG9wOjp0b3VjaHBhZC9icmlnaHRuZXNzCiAgIGVjaG8gMCA+
IC9zeXMvY2xhc3MvbGVkcy9kZWxsLWxhcHRvcDo6dG91Y2hwYWQvYnJpZ2h0bmVzcwoKU2lnbmVk
LW9mZi1ieTogQWNlTGFuIEthbyA8YWNlbGFuLmthb0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2RlbGwtbGFwdG9wLmMgfCAgIDg0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwtbGFwdG9w
LmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsLWxhcHRvcC5jCmluZGV4IGYzMWZhNGUuLmE0
M2NmZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwtbGFwdG9wLmMKKysr
IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvZGVsbC1sYXB0b3AuYwpAQCAtNjAsNiArNjAsMjIgQEAg
c3RydWN0IGNhbGxpbmdfaW50ZXJmYWNlX3N0cnVjdHVyZSB7CiAJc3RydWN0IGNhbGxpbmdfaW50
ZXJmYWNlX3Rva2VuIHRva2Vuc1tdOwogfSBfX3BhY2tlZDsKIAorc3RydWN0IHF1aXJrX2VudHJ5
IHsKKwl1OCB0b3VjaHBhZF9sZWQ7Cit9OworCitzdGF0aWMgc3RydWN0IHF1aXJrX2VudHJ5ICpx
dWlya3M7CisKK3N0YXRpYyBzdHJ1Y3QgcXVpcmtfZW50cnkgcXVpcmtfZGVsbF92b3N0cm9fdjEz
MCA9IHsKKwkudG91Y2hwYWRfbGVkID0gMSwKK307CisKK3N0YXRpYyBpbnQgZG1pX21hdGNoZWQo
Y29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmRtaSkKK3sKKwlxdWlya3MgPSBkbWktPmRyaXZl
cl9kYXRhOworCXJldHVybiAxOworfQorCiBzdGF0aWMgaW50IGRhX2NvbW1hbmRfYWRkcmVzczsK
IHN0YXRpYyBpbnQgZGFfY29tbWFuZF9jb2RlOwogc3RhdGljIGludCBkYV9udW1fdG9rZW5zOwpA
QCAtMTQ5LDYgKzE2NSwyNyBAQCBzdGF0aWMgc3RydWN0IGRtaV9zeXN0ZW1faWQgX19kZXZpbml0
ZGF0YSBkZWxsX2JsYWNrbGlzdFtdID0gewogCXt9CiB9OwogCitzdGF0aWMgc3RydWN0IGRtaV9z
eXN0ZW1faWQgX19kZXZpbml0ZGF0YSBkZWxsX3F1aXJrc1tdID0geworCXsKKwkJLmNhbGxiYWNr
ID0gZG1pX21hdGNoZWQsCisJCS5pZGVudCA9ICJEZWxsIFZvc3RybyBWMTMwIiwKKwkJLm1hdGNo
ZXMgPSB7CisJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJEZWxsIEluYy4iKSwKKwkJCURN
SV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiVm9zdHJvIFYxMzAiKSwKKwkJfSwKKwkJLmRyaXZl
cl9kYXRhID0gJnF1aXJrX2RlbGxfdm9zdHJvX3YxMzAsCisJfSwKKwl7CisJCS5jYWxsYmFjayA9
IGRtaV9tYXRjaGVkLAorCQkuaWRlbnQgPSAiRGVsbCBWb3N0cm8gVjEzMSIsCisJCS5tYXRjaGVz
ID0geworCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiRGVsbCBJbmMuIiksCisJCQlETUlf
TUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIlZvc3RybyBWMTMxIiksCisJCX0sCisJCS5kcml2ZXJf
ZGF0YSA9ICZxdWlya19kZWxsX3Zvc3Ryb192MTMwLAorCX0sCit9OworCiBzdGF0aWMgc3RydWN0
IGNhbGxpbmdfaW50ZXJmYWNlX2J1ZmZlciAqYnVmZmVyOwogc3RhdGljIHN0cnVjdCBwYWdlICpi
dWZmZXJwYWdlOwogc3RhdGljIERFRklORV9NVVRFWChidWZmZXJfbXV0ZXgpOwpAQCAtNTUyLDYg
KzU4OSw0NCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgZGVsbF9vcHMgPSB7
CiAJLnVwZGF0ZV9zdGF0dXMgID0gZGVsbF9zZW5kX2ludGVuc2l0eSwKIH07CiAKK3N0YXRpYyB2
b2lkIHRvdWNocGFkX2xlZF9vbigpCit7CisJaW50IGNvbW1hbmQgPSAweDk3OworCWNoYXIgZGF0
YSA9IDE7CisJaTgwNDJfY29tbWFuZCgmZGF0YSwgY29tbWFuZCB8IDEgPDwgMTIpOworfQorCitz
dGF0aWMgdm9pZCB0b3VjaHBhZF9sZWRfb2ZmKCkKK3sKKwlpbnQgY29tbWFuZCA9IDB4OTc7CisJ
Y2hhciBkYXRhID0gMjsKKwlpODA0Ml9jb21tYW5kKCZkYXRhLCBjb21tYW5kIHwgMSA8PCAxMik7
Cit9CisKK3N0YXRpYyB2b2lkIHRvdWNocGFkX2xlZF9zZXQoc3RydWN0IGxlZF9jbGFzc2RldiAq
bGVkX2NkZXYsCisJZW51bSBsZWRfYnJpZ2h0bmVzcyB2YWx1ZSkKK3sKKwlpZiAodmFsdWUgPiAw
KQorCQl0b3VjaHBhZF9sZWRfb24oKTsKKwllbHNlCisJCXRvdWNocGFkX2xlZF9vZmYoKTsKK30K
Kworc3RhdGljIHN0cnVjdCBsZWRfY2xhc3NkZXYgdG91Y2hwYWRfbGVkID0geworCS5uYW1lID0g
ImRlbGwtbGFwdG9wOjp0b3VjaHBhZCIsCisJLmJyaWdodG5lc3Nfc2V0ID0gdG91Y2hwYWRfbGVk
X3NldCwKK307CisKK3N0YXRpYyBpbnQgX19kZXZpbml0IHRvdWNocGFkX2xlZF9pbml0KHN0cnVj
dCBkZXZpY2UgKmRldikKK3sKKwlyZXR1cm4gbGVkX2NsYXNzZGV2X3JlZ2lzdGVyKGRldiwgJnRv
dWNocGFkX2xlZCk7Cit9CisKK3N0YXRpYyB2b2lkIHRvdWNocGFkX2xlZF9leGl0KHZvaWQpCit7
CisJbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoJnRvdWNocGFkX2xlZCk7Cit9CisKIHN0YXRpYyBi
b29sIGRlbGxfbGFwdG9wX2k4MDQyX2ZpbHRlcih1bnNpZ25lZCBjaGFyIGRhdGEsIHVuc2lnbmVk
IGNoYXIgc3RyLAogCQkJICAgICAgc3RydWN0IHNlcmlvICpwb3J0KQogewpAQCAtNTg0LDYgKzY1
OSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBkZWxsX2luaXQodm9pZCkKIAlpZiAoIWRtaV9jaGVj
a19zeXN0ZW0oZGVsbF9kZXZpY2VfdGFibGUpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAorCXF1aXJr
cyA9IE5VTEw7CisJLyogZmluZCBpZiB0aGlzIG1hY2hpbmUgc3VwcG9ydCBvdGhlciBmdW5jdGlv
bnMgKi8KKwlkbWlfY2hlY2tfc3lzdGVtKGRlbGxfcXVpcmtzKTsKKwogCWRtaV93YWxrKGZpbmRf
dG9rZW5zLCBOVUxMKTsKIAogCWlmICghZGFfdG9rZW5zKSAgewpAQCAtNjI2LDYgKzcwNSw5IEBA
IHN0YXRpYyBpbnQgX19pbml0IGRlbGxfaW5pdCh2b2lkKQogCQlnb3RvIGZhaWxfZmlsdGVyOwog
CX0KIAorCWlmIChxdWlya3MgJiYgcXVpcmtzLT50b3VjaHBhZF9sZWQpCisJCXRvdWNocGFkX2xl
ZF9pbml0KCZwbGF0Zm9ybV9kZXZpY2UtPmRldik7CisKIAlkZWxsX2xhcHRvcF9kaXIgPSBkZWJ1
Z2ZzX2NyZWF0ZV9kaXIoImRlbGxfbGFwdG9wIiwgTlVMTCk7CiAJaWYgKGRlbGxfbGFwdG9wX2Rp
ciAhPSBOVUxMKQogCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyZmtpbGwiLCAwNDQ0LCBkZWxsX2xh
cHRvcF9kaXIsIE5VTEwsCkBAIC02OTIsNiArNzc0LDggQEAgZmFpbF9wbGF0Zm9ybV9kcml2ZXI6
CiBzdGF0aWMgdm9pZCBfX2V4aXQgZGVsbF9leGl0KHZvaWQpCiB7CiAJZGVidWdmc19yZW1vdmVf
cmVjdXJzaXZlKGRlbGxfbGFwdG9wX2Rpcik7CisJaWYgKHF1aXJrcyAmJiBxdWlya3MtPnRvdWNo
cGFkX2xlZCkKKwkJdG91Y2hwYWRfbGVkX2V4aXQoKTsKIAlpODA0Ml9yZW1vdmVfZmlsdGVyKGRl
bGxfbGFwdG9wX2k4MDQyX2ZpbHRlcik7CiAJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZkZWxs
X3Jma2lsbF93b3JrKTsKIAliYWNrbGlnaHRfZGV2aWNlX3VucmVnaXN0ZXIoZGVsbF9iYWNrbGln
aHRfZGV2aWNlKTsKLS0gCjEuNy41LjQKCg==
--00163630f90b76c63004ae74d6af--
