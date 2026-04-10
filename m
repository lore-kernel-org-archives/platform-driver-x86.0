Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928230B51F;
	Fri, 10 Apr 2026 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842395; cv=none; b=CU7ap5Gg1Yjzs+0dgOGCS7AeVskCcEv6wZlabcG8oZpxbkT7X6XMG4qsSuay2iQGDWIca79/nos2oMUQalGOC6cx60IrkSBRhcLFC/y/PNIaLb8/sAT/45oGAdhAruKpk/JlteR/7SyzKVugvqLUNVrnWL4m2U6BfOcbzATkMtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842395; c=relaxed/simple;
	bh=V2sid6leGM4CbMu8wZXd+33vBKYY+3SYxv3MHsVtQVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acOLxzVMgESvVYIGdX8F/a55I2Gynd4SKgLv72Q5WfErBDivzF8KKAzNC+0BsNlOngsHPTn3Oz8QWl2Hz16owKanT4/OGs8JLS8mt/AHOzTCwJaJtXfImUZqlpdDejDNAAnQ3hXvll5vXstih6ikuEt40HlSQMOpCjrt2QrTzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ht+lJ5vp; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ht+lJ5vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775842390; x=1776447190; i=w_armin@gmx.de;
	bh=V2sid6leGM4CbMu8wZXd+33vBKYY+3SYxv3MHsVtQVM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ht+lJ5vp/YQdGkiRmtu7T9ZPRg33NVdzBLspgTlDXenLRChGurgDiVcnJpHFzCnc
	 tj3T4bXpyNt4Z8gxMiQVxhDKZlucelAvA4BlddMwHJUxe8RUIq4ZMA+wGiPZfDJKp
	 h8XRP7OL1KhxIzsvMol2FXxFdeOKmeV+Zmm4WQUVD93bVuHnEzoCsbgIOP4HAVP31
	 Wp9O7NOQexHnBA9sfqpp5TNCiOGSxH+rNsHU92QFP72jZqCIFRhJoyxRxivOdGce8
	 YCoBGO7HIh8Up3ESn/v2jqmjeyJnf5NmzRTxm0oeH0T/39bliaWnvN9NEAhaM2EHD
	 +6cg+bBRQZhTVt6Whw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMobO-1vuolu1ku4-00LwLv; Fri, 10
 Apr 2026 19:33:10 +0200
Message-ID: <846ff4c7-9be8-44e3-b851-e0d5dd988149@gmx.de>
Date: Fri, 10 Apr 2026 19:33:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] platform/x86: uniwill-laptop: Rework FN lock/super
 key suspend handling
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-5-W_Armin@gmx.de>
 <3edac714-783a-46dc-8240-4c9062b3c8be@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3edac714-783a-46dc-8240-4c9062b3c8be@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r+str9fvHbJTuykQSvMLEtUdMNvrxxmRLhdd3HVq0EWd9pxzJiz
 /3bgiG4Up315so4lhm5uBuf8g1JlQuixomcc0EfMqmYukI4Rt4RPzVtCduQcnY/5yJGgXnO
 JKJN9ada76FAiK+BOx59rLWkNj1GgGYyb/bljjrecIwq1ejqg6WdZs+PyRIijDT4A5eAnCC
 +7zu/R8mU8XDv6S1sZYSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b3xWwCnCZxU=;xWP1BbiSxvL9cuKi1GwUnyoaWTL
 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
 0mfDyd8uy5nG7AQ==

Am 10.04.26 um 17:30 schrieb Werner Sembach:

>
> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>> Currently the supend handling for the FN lock and super key enable
>
> *suspend
>
> Other then this typo lgtm:
>
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

Good catch, will fix.

Thanks,
Armin Wolf

>
>> features saves the whole values of the affected registers instead of
>> the individual feature state. This duplicates the register access
>> logic from the associated sysfs attributes.
>>
>> Rework the suspend handling to reuse said register access logic and
>> only store the individual feature state as a boolean value.
>>
>> Signed-off-by: Armin Wolf<W_Armin@gmx.de>
>> ---
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 117 ++++++++++++--=
=2D-----
>> =C2=A0 1 file changed, 73 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 7c7ea0e76966..4d149b39d94e 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -341,8 +341,8 @@ struct uniwill_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int last_charge_ctrl;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex battery_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects the list of currently=20
>> registered batteries */
>> -=C2=A0=C2=A0=C2=A0 unsigned int last_status;
>> -=C2=A0=C2=A0=C2=A0 unsigned int last_switch_status;
>> +=C2=A0=C2=A0=C2=A0 bool last_fn_lock_state;
>> +=C2=A0=C2=A0=C2=A0 bool last_super_key_enable_state;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex super_key_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects the toggling of the=20
>> super key lock state */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head batteries;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex led_lock;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* Protects writes to the=20
>> lightbar registers */
>> @@ -619,11 +619,22 @@ static const struct regmap_config=20
>> uniwill_ec_config =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .use_single_write =3D true,
>> =C2=A0 };
>> =C2=A0 +static int uniwill_write_fn_lock(struct uniwill_data *data, boo=
l=20
>> status)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (status)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FN_LOCK_STATUS;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_ADDR_BIO=
S_OEM,=20
>> FN_LOCK_STATUS, value);
>> +}
>> +
>> =C2=A0 static ssize_t fn_lock_store(struct device *dev, struct=20
>> device_attribute *attr, const char *buf,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t count)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> -=C2=A0=C2=A0=C2=A0 unsigned int value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 @@ -631,21 +642,15 @@ static ssize_t fn_lock_store(struct device=
=20
>> *dev, struct device_attribute *attr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (enable)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FN_LOCK_STATUS;
>> -=C2=A0=C2=A0=C2=A0 else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_BI=
OS_OEM,=20
>> FN_LOCK_STATUS, value);
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_write_fn_lock(data, enable);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return count;
>> =C2=A0 }
>> =C2=A0 -static ssize_t fn_lock_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> +static int uniwill_read_fn_lock(struct uniwill_data *data, bool=20
>> *status)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 @@ -653,23 +658,31 @@ static ssize_t fn_lock_show(struct device=
=20
>> *dev, struct device_attribute *attr, c
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%d\n", !!(value & FN=
_LOCK_STATUS));
>> -}
>> +=C2=A0=C2=A0=C2=A0 *status =3D !!(value & FN_LOCK_STATUS);
>> =C2=A0 -static DEVICE_ATTR_RW(fn_lock);
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> =C2=A0 -static ssize_t super_key_enable_store(struct device *dev, struc=
t=20
>> device_attribute *attr,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf,=
 size_t count)
>> +static ssize_t fn_lock_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> -=C2=A0=C2=A0=C2=A0 unsigned int value;
>> -=C2=A0=C2=A0=C2=A0 bool enable;
>> +=C2=A0=C2=A0=C2=A0 bool status;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D kstrtobool(buf, &enable);
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_read_fn_lock(data, &status);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%d\n", status);
>> +}
>> +
>> +static DEVICE_ATTR_RW(fn_lock);
>> +
>> +static int uniwill_write_super_key_enable(struct uniwill_data *data,=
=20
>> bool status)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->super_key_lock);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap,=
 EC_ADDR_SWITCH_STATUS, &value);
>> @@ -680,20 +693,33 @@ static ssize_t super_key_enable_store(struct=20
>> device *dev, struct device_attribut
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can only toggle the super key=
 lock, so we return early if=20
>> the setting
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is already in the correct state.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return count;
>> +=C2=A0=C2=A0=C2=A0 if (status =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_TRIG=
GER,=20
>> TRIGGER_SUPER_KEY_LOCK,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>> +}
>> +
>> +static ssize_t super_key_enable_store(struct device *dev, struct=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf,=
 size_t count)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 bool enable;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D regmap_write_bits(data->regmap, EC_A=
DDR_TRIGGER,=20
>> TRIGGER_SUPER_KEY_LOCK,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>> +=C2=A0=C2=A0=C2=A0 ret =3D kstrtobool(buf, &enable);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_write_super_key_enable(data, enable=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return count;
>> =C2=A0 }
>> =C2=A0 -static ssize_t super_key_enable_show(struct device *dev, struct=
=20
>> device_attribute *attr, char *buf)
>> +static int uniwill_read_super_key_enable(struct uniwill_data *data,=20
>> bool *status)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 @@ -701,7 +727,22 @@ static ssize_t super_key_enable_show(struct=
=20
>> device *dev, struct device_attribute
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%d\n", !(value & SUP=
ER_KEY_LOCK_STATUS));
>> +=C2=A0=C2=A0=C2=A0 *status =3D !(value & SUPER_KEY_LOCK_STATUS);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static ssize_t super_key_enable_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 bool status;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_read_super_key_enable(data, &status=
);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%d\n", status);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static DEVICE_ATTR_RW(super_key_enable);
>> @@ -1715,10 +1756,10 @@ static int uniwill_suspend_fn_lock(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The EC_ADDR_BIOS_OEM is marked as volatile,=
 so we have to=20
>> restore it
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * EC_ADDR_BIOS_OEM is marked as volatile, so =
we have to restore it
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ourselves.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_BIOS_OEM,=
=20
>> &data->last_status);
>> +=C2=A0=C2=A0=C2=A0 return uniwill_read_fn_lock(data, &data->last_fn_lo=
ck_state);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int uniwill_suspend_super_key(struct uniwill_data =
*data)
>> @@ -1727,10 +1768,10 @@ static int uniwill_suspend_super_key(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The EC_ADDR_SWITCH_STATUS is marked as vola=
tile, so we have=20
>> to restore it
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * EC_ADDR_SWITCH_STATUS is marked as volatile=
, so we have to=20
>> restore it
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ourselves.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_SWITCH_STA=
TUS,=20
>> &data->last_switch_status);
>> +=C2=A0=C2=A0=C2=A0 return uniwill_read_super_key_enable(data,=20
>> &data->last_super_key_enable_state);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int uniwill_suspend_battery(struct uniwill_data *d=
ata)
>> @@ -1787,27 +1828,15 @@ static int uniwill_resume_fn_lock(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWI=
LL_FEATURE_FN_LOCK))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_A=
DDR_BIOS_OEM,=20
>> FN_LOCK_STATUS,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->last_status);
>> +=C2=A0=C2=A0=C2=A0 return uniwill_write_fn_lock(data, data->last_fn_lo=
ck_state);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int uniwill_resume_super_key(struct uniwill_data *=
data)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 unsigned int value;
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWI=
LL_FEATURE_SUPER_KEY))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SW=
ITCH_STATUS, &value);
>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 if ((data->last_switch_status & SUPER_KEY_LOCK_STAT=
US) =3D=3D (value=20
>> & SUPER_KEY_LOCK_STATUS))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> -
>> -=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_TRIG=
GER,=20
>> TRIGGER_SUPER_KEY_LOCK,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>> +=C2=A0=C2=A0=C2=A0 return uniwill_write_super_key_enable(data,=20
>> data->last_super_key_enable_state);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int uniwill_resume_battery(struct uniwill_data *da=
ta)
