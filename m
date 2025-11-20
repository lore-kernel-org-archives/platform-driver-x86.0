Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891111534EC;
	Thu, 20 Nov 2025 01:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763601399; cv=none; b=ZHYCBkPg1s/EanYBsXBwPBKykQKq1+lZ2KDOA9msQfdBjWX12/tKKApXGfFFUAdEo3Hv2ROlu+8Oc2iliQ6KcAN/EXx5RWdWNtRqLQ+tbJox8rpquWJLv1lByTVjWj4gA74LhcqolB66UiHrGNXeZeFou/Kovg6cCkrdIoJX8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763601399; c=relaxed/simple;
	bh=BM1qOo5ArXw3hSVh1DhIj/SRfoYtcJxpXe+BVK0s3pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCEYv5/ouTDTKsFuU+GeFy5uJayuBe+8b3qbZK2YaDolUfsTJQljxJCIKBdV/4ujbmScXnw8swiCpOZ9q/4O6CwgfXT7XZsoc92SA6MbTQafGCj8k8vXQJ3PhsFmWTfpDG9MiuWi+4I/OnLFynq6GCJd7edQpYzOPzNZIgRUue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FsUTOs2z; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FsUTOs2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763601384; x=1764206184; i=w_armin@gmx.de;
	bh=BM1qOo5ArXw3hSVh1DhIj/SRfoYtcJxpXe+BVK0s3pc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FsUTOs2z5vaGXv+GFsdRJKtCgm7zol86yIXxuArIygXMtVSvekVkPW8f1PmgHv+p
	 9XHvJBZcqtJ1GBtUoSLCZZ9ImzllzqbElYRNxQe66rcj7KJMMVajY+s6KuyZk/3ft
	 UFq3sxLV1d69T672gk8zFRjwNSu4s7RrolsHRCTQZuXyEDDDQHD6dL4/9Pbw38sE0
	 8p0ZDCxkpU+7KWLvYqL3ws8ZXVF25L/Tiok1qXfdSuoPTyZxhybeoyDhLL9LJGOsb
	 Wo5WdJQ8XbpaYhp1mClhRQn/OCu94m2BcapEGuuxUl3r+fxguJUIKxXS0Jnsl8EHS
	 kZvLaK+O4srN+WYbbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1va7HX3B0u-00SWVu; Thu, 20
 Nov 2025 02:16:24 +0100
Message-ID: <77862c22-174b-4ca1-bcb5-8dbf2d3c48a3@gmx.de>
Date: Thu, 20 Nov 2025 02:16:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86/uniwill: Implement cTGP setting
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-4-wse@tuxedocomputers.com>
 <9c5205e8-d3f2-4dbd-8863-5347bb5e77c9@gmx.de>
 <9a4ff777-f786-4d59-8c36-c7b6eab9e3d1@tuxedocomputers.com>
 <811e260b-7805-4ec6-8bf3-1b6a73af891a@gmx.de>
 <24109992-05ae-4da1-9a34-26838ffc71c7@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <24109992-05ae-4da1-9a34-26838ffc71c7@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HNzz4sNw20EhlbmeEXz7C+gZFtKvggMaxUzNvpuBJYjmtImZLDa
 BYh38wUrwEVIguxjBnOfx3mALhecIic+he18O2rnmzTQhVk6NiZzHzzI86nNcYFR1Fp6tGV
 aki0xnjeOr0fRGRrM/97NoYJWMrGNX17hDIcauG1pYMl6FLbecZP5Ua5NIXtZGfEPQagvws
 PdYJxvzrKt3k0gRTlFv8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l4rU2HDz4hA=;BKmUqV+MKTUL+0nC1QFK38fYrwv
 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
 I1MdPIOw=

Am 19.11.25 um 16:34 schrieb Werner Sembach:

>
> Am 18.11.25 um 14:29 schrieb Armin Wolf:
>> Am 18.11.25 um 13:58 schrieb Werner Sembach:
>>
>>>
>>> Am 18.11.25 um 12:12 schrieb Armin Wolf:
>>>> Am 17.11.25 um 14:24 schrieb Werner Sembach:
>>>>
>>>>> Uniwill offers user setable cTGP for their EC on devices using=20
>>>>> NVIDIA 3000
>>>>> Series and newer GPUs. This patch implements this setting as a sysfs
>>>>> attribute.
>>>>>
>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>> ---
>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 110=20
>>>>> +++++++++++++++++++-
>>>>> =C2=A0 1 file changed, 107 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>> index 0cb86a701b2e1..de3417d9d1ac0 100644
>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>> @@ -122,11 +122,11 @@
>>>>> =C2=A0 #define CTGP_DB_DB_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(1)
>>>>> =C2=A0 #define CTGP_DB_CTGP_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(2)
>>>>> =C2=A0 -#define EC_ADDR_CTGP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x0744
>>>>> +#define EC_ADDR_CTGP_DB_CTGP_OFFSET=C2=A0=C2=A0=C2=A0 0x0744
>>>>> =C2=A0 -#define EC_ADDR_TPP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x0745
>>>>> +#define EC_ADDR_CTGP_DB_TPP_OFFSET=C2=A0=C2=A0=C2=A0 0x0745
>>>>> =C2=A0 -#define EC_ADDR_MAX_TGP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0746
>>>>> +#define EC_ADDR_CTGP_DB_DB_OFFSET=C2=A0=C2=A0=C2=A0 0x0746
>>>>> =C2=A0 =C2=A0 #define EC_ADDR_LIGHTBAR_AC_CTRL=C2=A0=C2=A0=C2=A0 0x0=
748
>>>>> =C2=A0 #define LIGHTBAR_APP_EXISTS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(0)
>>>>> @@ -317,6 +317,7 @@
>>>>> =C2=A0 #define UNIWILL_FEATURE_LIGHTBAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(3)
>>>>> =C2=A0 #define UNIWILL_FEATURE_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>>>>> =C2=A0 #define UNIWILL_FEATURE_HWMON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5)
>>>>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 BIT(6=
)
>>>>> =C2=A0 =C2=A0 struct uniwill_data {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>>>>> @@ -498,6 +499,10 @@ static bool uniwill_writeable_reg(struct=20
>>>>> device *dev, unsigned int reg)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_RED:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_GREEN:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_BLUE:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTRL:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_DB_OFFSET:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>>> @@ -531,6 +536,10 @@ static bool uniwill_readable_reg(struct=20
>>>>> device *dev, unsigned int reg)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_RED:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_GREEN:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_BLUE:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTRL:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_DB_OFFSET:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>>> @@ -786,6 +795,68 @@ static ssize_t=20
>>>>> breathing_in_suspend_show(struct device *dev, struct device_attri
>>>>> =C2=A0 =C2=A0 static DEVICE_ATTR_RW(breathing_in_suspend);
>>>>> =C2=A0 +static ssize_t ctgp_offset_store(struct device *dev, struct=
=20
>>>>> device_attribute *attr,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(de=
v);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D kstrtouint(buf, 0, &value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_=
DB_CTGP_OFFSET,=20
>>>>> value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return count;
>>>>> +}
>>>>> +
>>>>> +static ssize_t ctgp_offset_show(struct device *dev, struct=20
>>>>> device_attribute *attr,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 char *buf)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(de=
v);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_CTGP_D=
B_CTGP_OFFSET,=20
>>>>> &value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%u\n", value);
>>>>> +}
>>>>> +
>>>>> +DEVICE_ATTR_RW(ctgp_offset);
>>>>> +
>>>>> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_NVIDI=
A_CTGP_CONTROL))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR=
_CTGP_DB_CTRL,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE =
|=20
>>>>> CTGP_DB_CTGP_ENABLE,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE =
|=20
>>>>> CTGP_DB_CTGP_ENABLE);
>>>>
>>>> I think we should initialize the power limits before enabling them,=
=20
>>>> otherwise
>>>> the relevant registers might still contain invalid data.
>>> from boot they are all just 0, but ofc i can shuffle things around
>>
>> Please do, i prefer to play it safe here as we are dealing with power=
=20
>> limits.
>>
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_=
DB_CTGP_OFFSET,=20
>>>>> 0);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_=
DB_TPP_OFFSET,=20
>>>>> 255);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_=
DB_DB_OFFSET, 25);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>
>>>> Are those values the maximum values supported by the platform? If=20
>>>> yes then
>>>> we should enforce them for sysfs writes.
>>>>
>>>> Also, why is only cTGP accessible from user space?
>>>
>>> Because that is the only one that should be settable by the user=20
>>> according to NVIDIA, the rest should be set by the ODM.
>>>
>>> EC_ADDR_CTGP_DB_TPP_OFFSET max value is just max u8 and would be=20
>>> another way to cap cpu + gpu power but there are already other ways=20
>>> to do that (e.g. the power profiles) so i don't see a value in=20
>>> capping them here in any way.
>>>
>>> EC_ADDR_CTGP_DB_DB_OFFSET max value 25 is just the maximum value for=
=20
>>> dynamic boost defined by NVIDIA, bigger values are just being=20
>>> ignored (behave the same as having set 25): again the same story:=20
>>> devices that don't support 25 W dynamic boost are already capped=20
>>> elsewhere so i don't see value in capping it here.
>>>
>>> EC_ADDR_CTGP_DB_CTGP_OFFSET is the only one intented to be set by=20
>>> the user, problem: the max value is different from device to device,=
=20
>>> and i only know how to probe it using nvidia smi from userspace.=20
>>> Good news: nothing bad happens when you set a higher value (same as=20
>>> for dynamic boost)
>>>
>> I see, do you know the max. value for cTGP for the devices you added=20
>> in patch 1? The intel notebooks use a similar
>> setup, but they limit the max. value of cTGP depending on the GPU=20
>> module.
>>
>> I think that extending uniwill_data to contain a upper limit for cTGP=
=20
>> would be nice for usability. We can use a default
>> value (U8_MAX) for devices where the upper limit is unknown. For=20
>> devices where the limit is known, userspace application
>> can use the limit for showing it in the UI. Additionally i am=20
>> planning to integrate cTGP into the platform profile, as it
>> is done on Intel machines. For this i will add the ability to define=20
>> cTGP values for each platform profile, with the
>> max value being used for the upcoming max-power platform profile=20
>> (also called "benchmark mode" on intel platforms).
>
> cTGP is a little bit complicated
>
> cTGP can be set between a Base TGP and a Max TGP (what you see here in=
=20
> the driver is actually only the offset from the base TGP).
>
> The Dynamic Boost setting here give the max width of the dynamic boost=
=20
> windows, however this is still affected by the max TGP.
>
> Say cTGP is 100W Max TGP is 115W and Dynamic Boost setting is 25W ->=20
> The Dynamic Boost window is actually just 15W because it can't go over=
=20
> Max TGP.
>
> Now setting the cTGP to 80W, the=C2=A0Dynamic Boost window becomes 25W a=
nd=20
> the GPU will never clock above 105W.
>
> What does this mean? Setting cTGP between 80W and 90W actually changes=
=20
> the overall power consumption, while setting it between 90W and 115W=20
> does not, it just reduces the drivers automatic power allocation=20
> window in favor of the gpu. -> At a certain point more cTGP does not=20
> bring more performance, it actually can hurt performance for CPU heavy=
=20
> tasks.
>
> In addition: Most Uniwill devies don't even have a window between Base=
=20
> TGP and Max TGP that is bigger then the allowed Dynamic Boost window.=20
> -> There is no power saving in setting cTGP on most Uniwill devices=20
> and the "more performance" window of cTGP has a witdh of 0.
>
> And all Uniwill devices that i have seen have the GPU locked at a Watt=
=20
> level below the Base TGP level on Battery. -> There is no battery=20
> saving in setting cTGP on all Uniwill devices
>
Thank you for explaining the meaning of cTGP and dynamic boost for me. I w=
ould still like to mirror the behavior of the OEM software
regarding the integration of cTGP into the platform profile, however it is=
 totally fine if not all devices enable this.

>>
>> To put it short please add an additional sysfs attribute (maybe=20
>> called ctgp_offset_max?) add just return U8_MAX for now.
>> We can then add the individual limits for each device later if desired.
> I don't think a placeholder sysfs attribute that is not used by=20
> anything is sensefull. I would wait with including it until it is=20
> actually used.

Alright, fine. I will add this additional sysfs attribute when i upstream =
the cTGP handling for Intel notebooks.

>>
>> Thanks,
>> Armin Wolf
> On a different note, leaving the one device out that needs the qurik=20
> callback, the patch should allready be usefull and ready?

Not really, you still need to rework the DMI table. I already sent you the=
 patch with the device descriptor infrastructure, i am sure
that you can build the cTGP support atop of that.

Thanks,
Armin Wolf

>>
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>> =C2=A0 static struct attribute *uniwill_attrs[] =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Keyboard-related */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_fn_lock_toggle_enable.attr,
>>>>> @@ -794,6 +865,8 @@ static struct attribute *uniwill_attrs[] =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Lightbar-related */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_rainbow_animation.attr,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_breathing_in_suspend.attr,
>>>>> +=C2=A0=C2=A0=C2=A0 /* Power-management-related */
>>>>> +=C2=A0=C2=A0=C2=A0 &dev_attr_ctgp_offset.attr,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>>>> =C2=A0 };
>>>>> =C2=A0 @@ -820,6 +893,11 @@ static umode_t=20
>>>>> uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return attr->mode;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_ctgp_offset.att=
r) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (supported_features &=
=20
>>>>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return attr->mode;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>> =C2=A0 }
>>>>> =C2=A0 @@ -1371,6 +1449,10 @@ static int uniwill_probe(struct=20
>>>>> platform_device *pdev)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_nvidia_ctgp_init(data);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return uniwill_input_init(data);
>>>>> =C2=A0 }
>>>>> =C2=A0 @@ -1547,6 +1629,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO InfinityBook Pro 14/16 Gen7 Intel",
>>>>> @@ -1554,6 +1637,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO InfinityBook Pro 16 Gen7=20
>>>>> Intel/Commodore Omnia-Book Pro Gen 7",
>>>>> @@ -1561,6 +1645,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME,=20
>>>>> "PH6AG01_PH6AQ71_PH6AQI1"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO InfinityBook Pro 14/16 Gen8=20
>>>>> Intel/Commodore Omnia-Book Pro Gen 8",
>>>>> @@ -1575,6 +1660,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO InfinityBook Pro 16 Gen8 Intel",
>>>>> @@ -1582,6 +1668,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO InfinityBook Pro 14/15 Gen9 AMD",
>>>>> @@ -1694,6 +1781,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Polaris 15/17 Gen2 Intel",
>>>>> @@ -1701,6 +1789,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris/Polaris 15/17 Gen3 AMD",
>>>>> @@ -1708,6 +1797,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris/Polaris 15/17 Gen3 Intel",
>>>>> @@ -1715,6 +1805,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris/Polaris 15/17 Gen4 AMD",
>>>>> @@ -1722,6 +1813,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 15 Gen4 Intel",
>>>>> @@ -1729,6 +1821,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Polaris 15/17 Gen5 AMD",
>>>>> @@ -1736,6 +1829,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16 Gen5 AMD",
>>>>> @@ -1743,6 +1837,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16/17 Gen5 Intel/Commodore=20
>>>>> ORION Gen 5",
>>>>> @@ -1750,6 +1845,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris Slim 15 Gen6 AMD",
>>>>> @@ -1757,6 +1853,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris Slim 15 Gen6 Intel/Commodore=20
>>>>> ORION Slim 15 Gen6",
>>>>> @@ -1764,6 +1861,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16 Gen6 Intel/Commodore ORION=20
>>>>> 16 Gen6",
>>>>> @@ -1771,6 +1869,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16 Gen6 Intel/Commodore ORION=20
>>>>> 16 Gen6",
>>>>> @@ -1778,6 +1877,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 17 Gen6 Intel/Commodore ORION=20
>>>>> 17 Gen6",
>>>>> @@ -1785,6 +1885,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16 Gen7 AMD",
>>>>> @@ -1792,6 +1893,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16 Gen7 Intel",
>>>>> @@ -1799,6 +1901,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Stellaris 16 Gen7 Intel",
>>>>> @@ -1806,6 +1909,7 @@ static const struct dmi_system_id=20
>>>>> uniwill_dmi_table[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void=
=20
>>>>> *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "T=
UXEDO Pulse 14 Gen1 AMD",
>>>
>
