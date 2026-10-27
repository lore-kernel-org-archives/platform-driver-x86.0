Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135659;
	b=WoLQqurgodvKDY7R00JywcHgyhg6InNJKC8grQnZKubOtgmH8nc4szAyf8P+DetyqkM+
	 nwe+h8L6kaQ6nWrVR8b1kIseEOzFGtz1YGgkPLB7m9pzqq8m+JkGHqdYsFvV6s5ylj/Xg
	 37Kb5uOyPlxg7xUMGlkgUmR5FuZcaXYV2YsX9TReVVJ91wQoNzVKzv7xGcTwCPYKoYFot
	 8oFHONc7CAf3+fHt00+t7pU96a+PK9bm+IPl8ur/Q5sqzWvNz2B9eQYUzuGGO0WaPAp6f
	 LID6Y7ADDKt5VaFsze2FpvUS+ZzuCPqxUIhK8RYy8M9whkktkGkplF7luu6GSikOIDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135659;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=pzCgT4sbvMo96hL8W7W7gyyykhenMFMFaVcLFRDDuDM=;
	b=e/3ATUD52hGYjKiO5D1pxAqdcpTLF1vscxYyQc9yL0XRBCFZu01WLQF/A66T43cOtCqZ
	 +NEUsWb6kazLHn6mjttoFMi1nckZ1Yrhdkjs+JfNXZ1BXLtgQAVzbFnlxKaBHjtk3g6Ms
	 wopCHVoXy1OkJjZdFrGXxF6tJkWk5g9eEwkc0+QeU98t3Hk6rT+C/c9riNcNcnpc8PyVd
	 8WCinrwPWUjq8XZ3vsfrd/uTiVKs04eIwLDq15J69aSzaAiH0tJS0HA9bEAY21SSMbg29
	 CWLKPNDY6+gMN/Sg3PPuHkc521SQUn4erSEt5zht8UNMGD0PlDW8+ce3h073Z/hSTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=pWyvxheq;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10C606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 21:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE10C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=pWyvxheq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793135656; x=1793740456; i=w_armin@gmx.de;
	bh=pzCgT4sbvMo96hL8W7W7gyyykhenMFMFaVcLFRDDuDM=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pWyvxheqGYJUYXALLYvV3pmEG4IeO+XI7h5K2XhzwUHRVezTRP27xjCSl6YVE1Bq
	 N3lMJCo6EJjEI6A+xhHKfMvg85h2PkC7rBxnE27s8Rvk0jblokGyxXyeUby81bLxd
	 o/ErXFg3pyfBSPDannmuMCl4WaCF7hOMz4gknlh191wB0c75N2b6VxzGwcW0NnZL9
	 oiA23V/tAKapfFGSg/zMQmAYHGpId/rBWU/EYig3/49qTrbw0JSW3A0HCm59e5H22
	 mIvLDjBrYyJNID98YqRH+jSo2lgHXo25cHeV5W0YCPAyGLe0/tdSF88PggcRwix3S
	 V60vagGPIX8lX4CJJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHru-1wXz621JV4-00rtUE; Tue, 27
 Oct 2026 22:14:16 +0100
Content-Type: multipart/mixed; boundary="------------HIPy5gJ0HpMFkrAJ9jLZSLg0"
Message-ID: <56d9221d-c228-4037-8677-3d4737e323ca@gmx.de>
Date: Tue, 27 Oct 2026 22:14:15 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uniwill-laptop: XMG EVO 14 (E25) support - DMI entry, perf
 profiles, kbd backlight
To: Nico Kessler <nicokessler@icloud.com>
Cc: platform-driver-x86@vger.kernel.org
References: <8A581217-ADC4-4DC2-AE21-1A92537341B0@icloud.com>
 <7FEA1980-AFC6-4A6C-84E1-E820B7E6CF3C@icloud.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7FEA1980-AFC6-4A6C-84E1-E820B7E6CF3C@icloud.com>
X-Provags-ID: V03:K1:fwJk3hwWY6D2syMywx2B1gsusU0XRHYAYyeUgjG11eTCbLwcEsk
 sICzgIpVt2Ka4OChI+vgrb9h6TqugV0kFyVZ9ikenpE3O2CR4TWlu0+FxNAZSTRrYEL3sZj
 Xrgu5k8MzA3izZ1OcebyJ5yW8h83Ot/btMPpVCyInx6JXld2XsyAiLc5MGopQpqZ7eC+Fag
 SRJhM1saOmfAkFARQeX0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZcgvhBpYI+Q=;ea5VLxB9V5PZjMk4vfNnYPnezB+
 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

This is a multi-part message in MIME format.
--------------HIPy5gJ0HpMFkrAJ9jLZSLg0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 27.10.26 um 19:40 schrieb Nico Kessler:

> Hi Armin,
>
> a short addition to point 2 (charging profiles), now that I measured a f=
ull charge with each profile:
>
> Trickle: charge ends at 16.75 V (4.19 V/cell), shown as 100%
> Standard: charge goes to 17.62 V (4.40 V/cell), also shown as 100%,
> still in the CV phase at that point (1.1 A)
>
> So the EC limits the end voltage in Trickle and rescales the reported ca=
pacity, the OS sees 100% in both cases. During the Standard charge, 16.75 =
V under 2.1 A was reported as 86%.
>
> Thanks,
> Nico Kessler

Good work, i attached a patch that should whitelist your device. Can you j=
ust check that this patch works
as intended?

Thanks,
Armin Wolf

>> Am 27.10.2026 um 16:40 schrieb Nico Kessler <nicokessler@icloud.com>:
>>
>> =EF=BB=BF
>> =EF=BB=BF
>> Hi Armin,
>>
>> the XMG EVO 14 (E25) uses the same board as the TUXEDO InfinityBook Pro=
 14 Gen10 AMD, which is already in uniwill_dmi_table, but ships with a dif=
ferent system vendor, so uniwill-laptop does not load:
>>
>> sys_vendor: SchenkerTechnologiesGmbH
>> product_name: XMG EVO (E25)
>> board_name: XxKK4NAx_XxSP4NAx
>> CPU: AMD Ryzen AI 7 350
>> Kernel: 7.3.0-5-cachyos
>>
>> I built the 7.3 driver out of tree with an extra DMI entry and tested i=
t for a few hours. Findings below, all register values were read back from=
 the EC.
>>
>> 1) DMI entry
>>
>> With tux_featureset_4_descriptor and vendor "SchenkerTechnologiesGmbH" =
the driver loads and works (charge_types, hwmon, fn_lock).
>>
>> 2) Charging profiles (charge_types)
>>
>> Standard / Long_Life / Trickle map to the three profiles of the XMG Con=
trol Center on Windows (OEM_4 0x07A6 bits 5:4). Two observations:
>> - The firmware resets the profile to Standard on every boot (and when s=
ettings are saved in the BIOS setup). The Windows XMG Control Center re-ap=
plies it at startup; on Linux it has to be set again after each boot.
>> - With Trickle the charge ends at 100% displayed with 16.75 V (4S pack,=
 design voltage 15.4 V), so the reduced peak voltage seems to be handled b=
y the EC as XMG describes.
>>
>> 3) Performance profiles (not supported by the driver yet)
>>
>> The three BIOS profiles are selected through 0x0751 (EC_ADDR_MANUAL_FAN=
_CTRL). 0x07E8 reports the active one. Identical values whether set in the=
 BIOS setup or with the XMG Control Center on Windows; a full dump of 0x07=
00-0x07FF showed no other related changes:
>>
>> profile 0x0751 0x07E8 sustained PPT (stress-ng)
>> Balanced 0xa0 0x08 25 W, 62 C
>> Enthusiast 0x00 0x00 45 W, 81 C
>> Overboost 0x10 0x01 65 W, 94 C
>>
>> Writing 0x0751 from Linux switches the profile: 0x07E8 follows within 2=
 seconds and the power limits change as measured above. The setting surviv=
es reboots. PL1/PL2/PL4 (0x0783-0x0785) stay at 0 in all profiles.
>>
>> 4) Keyboard backlight (white, 4 levels)
>>
>> KBD_STATUS 0x078C reads 0x01 / 0x21 / 0x41 / 0x61 / 0x81 for off and le=
vels 1-4, so single color with kbd_led_max_brightness =3D 4 fits. Fn+Space=
 is handled by the EC, and the EC turns the backlight off during suspend a=
nd restores it by itself.
>> Note: uniwill_kbd_led_init() would set ENABLE_CHINA_MODE in 0x0782 here=
, because CHINA_MODE is not set in SUPPORT_2 (0x0766 =3D 0x90). I did not =
know what that does on this firmware, so I skipped that write (and the sus=
pend/resume writes) in my test build. Writing only the brightness bits wor=
ks fine.
>>
>> Could you add the DMI entry? If useful, I can send my test patch for th=
e profile and backlight parts, more register dumps, or test patches.
>>
>> Thanks,
>> Nico Kessler

--------------HIPy5gJ0HpMFkrAJ9jLZSLg0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-uniwill-laptop-Add-support-for-XMG-EVO-.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-uniwill-laptop-Add-support-for-XMG-EVO-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBlOTFiMGUwMzhkOGJmNDg1MzE5MzAzZTYxMmVlMmY1OGI0ZDkyZTk4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogVHVlLCAyNyBPY3QgMjAyNiAyMjowNDowOSArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4NjogdW5pd2lsbC1sYXB0b3A6IEFkZCBzdXBwb3J0IGZvciBYTUcgRVZPIDE0
CiAoRTI1KQoKVGhlIFhNRyBFVk8gMTQgKEUyNSkgdXNlcyB0aGUgc2FtZSBib2FyZCBhcyB0
aGUgVFVYRURPIEluZmluaXR5Qm9vawpQcm8gMTQgR2VuMTAgQU1ELCBidXQgY29udGFpbnMg
YSBkaWZmZXJlbnQgbWFudWZhY3R1cmVyIHN0cmluZy4KCkFkZCB0aGUgbmVjZXNzYXJ5IERN
SSBlbnRyeS4KClJlcG9ydGVkLWJ5OiBOaWNvIEtlc3NsZXIgPG5pY29rZXNzbGVyQGljbG91
ZC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGxhdGZvcm0tZHJpdmVy
LXg4Ni83RkVBMTk4MC1BRkM2LTRBNkMtODRFMS1FODIwQjdFNkNGM0NAaWNsb3VkLmNvbQpT
aWduZWQtb2ZmLWJ5OiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KLS0tCiBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni91bml3aWxsL3VuaXdpbGwtYWNwaS5jIHwgOCArKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxh
dGZvcm0veDg2L3VuaXdpbGwvdW5pd2lsbC1hY3BpLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni91bml3aWxsL3VuaXdpbGwtYWNwaS5jCmluZGV4IDk2Mjg0MzE2YzYzZC4uZjhmYTYxMzc0
OWE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni91bml3aWxsL3VuaXdpbGwt
YWNwaS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L3VuaXdpbGwvdW5pd2lsbC1hY3Bp
LmMKQEAgLTMyMDgsNiArMzIwOCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0
ZW1faWQgdW5pd2lsbF9kbWlfdGFibGVbXSBfX2luaXRjb25zdCA9IHsKIAkJfSwKIAkJLmRy
aXZlcl9kYXRhID0gJmxhcHFjNzFhX2xhcHFjNzFiX2Rlc2NyaXB0b3IsCiAJfSwKKwl7CisJ
CS5pZGVudCA9ICJYTUcgRVZPIDE0IChFMjUpIiwKKwkJLm1hdGNoZXMgPSB7CisJCQlETUlf
TUFUQ0goRE1JX1NZU19WRU5ET1IsICJTY2hlbmtlclRlY2hub2xvZ2llc0dtYkgiKSwKKwkJ
CURNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfTkFNRSwgIlh4S0s0TkF4X1h4U1A0TkF4Iiks
CisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICZneHhocnh4X2d4eG1yeHhfeHh4eDRueHhfZGVz
Y3JpcHRvciwKKwl9LAogCXsKIAkJLmlkZW50ID0gIkF2ZWxsIEE2MCBNVVYiLAogCQkubWF0
Y2hlcyA9IHsKLS0gCjIuNTYuMAoK

--------------HIPy5gJ0HpMFkrAJ9jLZSLg0--
