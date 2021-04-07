Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952CDC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6775161245
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352124AbhDGMUF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 08:20:05 -0400
Received: from mout.gmx.net ([212.227.15.15]:54515 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352110AbhDGMUF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 08:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617797986;
        bh=4kuw7/2y4aQZtn1PhjBi/BofBpePRyLZ3AG83QQH3+Y=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=dIpAHi5gVbjunY5zg2SG7secY4TlJsgn4YaF/jv8VKKSlDGZMkyrVMsMXSALcwu5A
         Dhhp+ylChNhZ2pbJZU9v+RDcZInfyTMoVZtKF/YLDp/IEVfsERPip66CiexlUbzk7n
         LywqsDRxbU/KhCZtYNy4xEhiaJypX/ltQNJC/dBQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.135.7.100] ([87.122.251.119]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1lJ5b7364m-00B3Xe; Wed, 07
 Apr 2021 14:19:45 +0200
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     smclt30p@gmail.com
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
From:   Thomas Koch <linrunner@gmx.net>
Message-ID: <6ead1585-9743-e56b-6552-564fabdd9930@gmx.net>
Date:   Wed, 7 Apr 2021 14:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e2a9/y2QaUa1UxBkc9Rkv1nR+/x1jeOIO3xtw4R30ACMVQJ8v+1
 a5ipo58q+Sd/2vOwbLcrsTBvjmgwe5L2pN8mEw2lPqdXk7b9JnzLyLboCY8zoC1lylp4WWa
 /SC+pUMuCH+P2BmTMahOiiT13j9TJzB+sizzzuyUmuTOx4cZ17LY/ssHeVUo4H6hdWWaVjb
 1iSuci7yVVAEBsz9LxKfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cvTWlPu+nzI=:mWyLLuK2x0v3+cKCvuUSL7
 YTdxvdLzGhRYOPN8KWSFhn9X/DFjUGM5Spmr7EIzRhhFNomXjp2gJiVysOMzcdhIn2Vjd0zUu
 ZCnIvLszgX8+wbHz4fjSWAB5/l2t3t2eUNJWwPoWbcC5HvRedKCvW4yWW4xXsXoWQPOug5cPd
 2sE50pmr/ZKeMdWe/B4uVz6cwUw1spyH9Fj1OSn78cbCpq/c7cp+drCsl0UY8cTwFm1ng2Red
 V/7VGLlPWBI+SdaTPNLP8cmGRbWBl8L5INSqNJqfBzp7Cjy6bkECAdK6UQHJGyO6eVM9PScrl
 k7azVhI97fuVNm1YRZdX/HieEbVAoix2AKrLHzqUiAssbHvTcsGX9vIuLDBU6rD9T3OP665B5
 5IgsQsp22AyIedn5oo4QdO/i15r3OtXRNswGAzHuMRw6S/R2DNDX+/WicA208ZL4ohUaG5ax4
 OCEnDXG4xNKZ7WY3jEw+BADDhVNj718D9sKiwisRPE1Xc1DF4UmGUXtX4kq1EhGCrjGwwMJ4V
 nBXa4W321aI/Z7jSfEGUD2GE233QA1oWo9UfEsfsiZ43Qgc3xWXliBU4g3soBrwxIEwcBtd+Y
 GGvWjnnkX0Cl+atXLiv+3G2Ae+MOd9ffMfcNAJi4FlKwrFEDDdk8obkriVU45VFbU0U8TVTw2
 Ub93GagnL8s7am/JWagdmX7WTqtPcEt+5fzWQRxG6/2c9G9Nmtxx4ugOYaSEstFrWEBxF9ZK5
 x6eIn1uhImYPeenHMfLqwQkAfPvjeui6VC3GufP3DRY10Zo8nEQigwJAK82BdeOvc8oDeI+tI
 iHz50V+7J8K1mCQID0UiVTE51QkhMlk43J0q/O4YuemlMBwN5TeGcVq0aA7uDCNPOUNr41zOM
 z2hR8oJBgv6/lRCaNTRtk8yBzi2lYDlvOMV1Haqc3pNMYvhgZcFRtkWs+XrU5q35lGcq6sT3a
 go5dvh/sjJtDlDOe4szbvFN/z1k9unWaI1Aqa7j10HqPpL50wgxP8/cH3whlJk4OYNJdRjrJh
 2dAMSINR/WIzSselb7S67OdBuIVZl0PEwvWdNnhSaaPt3o/xLLOGms/EnuR1C+X2bkqtafGAj
 0GYsjiQXfyAfeg6YyYwhwofKBLm9oHJJW6ZhJ4E//dCYPQU6WonrqPDJf8qmc7IsEuA4UuboN
 Gfp2v+LdWGJTqSf5w/+myrrexZ2kU4jxx0UrjmsorNTyPjdV/iz8jVSOZycQQfBcjsxC4=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,



 > 1. These features are useful, but not super useful and as such I wonder

 > how often they are used and this how well tested the firmware is wrt
these.

 > I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you

 > comment on if it is ok from a firmware pov to try and use the following

 > battery related ACPI methods on all thinkpads? :
 > #define GET_DISCHARGE	"BDSG"


 > #define SET_DISCHARGE	"BDSS"


 > #define GET_INHIBIT	"PSSG"


 > #define SET_INHIBIT	"BICS"



These ACPI methods are present in (with very few exceptions) all
ThinkPads released since 2012. I am curious to hear what Mark and Nitin
have to say, never read anything official about it.



Since 2012 there is also userspace tool tpacpi-bat [1] employing them
along with those for the start/stop threshold.



My own tool TLP makes use of tpacpi-bat for force_discharge also since
2012. From my experience in TLP support i can say there's a significant
user base and those who use thresholds also want to use force_discharge
for recalibration from time to time.


The patches at hand work flawlessly on my small ThinkPad collection.

[1] https://github.com/teleshoes/tpacpi-bat



=2D-

Freundliche Gr=C3=BC=C3=9Fe / Kind regards,

Thomas Koch



Mail : linrunner@gmx.net

Web  : https://linrunner.de/tlp


On 07.04.21 12:24, Hans de Goede wrote:
> Hi Nicola,
>
> Thank you for your patch series.
>
> I'm not sure what to do with these. I have a couple of concerns here:
>
> 1. These features are useful, but not super useful and as such I wonder
> how often they are used and this how well tested the firmware is wrt the=
se.
> I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
> comment on if it is ok from a firmware pov to try and use the following
> battery related ACPI methods on all thinkpads? :
>
> #define GET_DISCHARGE	"BDSG"
> #define SET_DISCHARGE	"BDSS"
> #define GET_INHIBIT	"PSSG"
> #define SET_INHIBIT	"BICS"
>
>
> 2. If we add support for this to the kernel we should probably
> first agree on standardized power-supply class property names for
> these, rather then coming up with our own names. ATM we register
> 2 names for the charge start threshold, the one which the thinkpad_acpi
> code invented and the standardized name which was later added.
>
> I've added Sebastian, the power-supply class / driver maintainer to
> the Cc. for this. Sebastian Nicolo wants to add support for 2 new
> features as power-supply properties:
>
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> ...
> +Battery forced discharging
> +--------------------------
> +
> +sysfs attribute:
> +/sys/class/power_supply/BATx/force_discharge
> +
> +Setting this attribute to 1 forces the battery to discharge while AC is=
 attached.
> +Setting it to 0 terminates forced discharging.
> +
> +Battery charge inhibiting
> +--------------------------
> +
> +sysfs attribute:
> +/sys/class/power_supply/BATx/inhibit_discharge
> +
> +Setting this attribute to 1 stops charging of the battery as a manual o=
verride
> +over the threshold attributes. Setting it to 0 terminates the override.
>
> Sebastian, I believe that this should be changes to instead be documente=
d
> in: Documentation/ABI/testing/sysfs-class-power
> and besides the rename I was wondering if you have any remarks on the pr=
oposed
> API before Nicolo sends out a v2 ?
>
> Regards,
>
> Hans
>
>
> On 3/17/21 3:01 PM, Nicolo' Piazzalunga wrote:
>> Lenovo ThinkPad systems have a feature that lets you
>> force the battery to discharge when AC is attached.
>>
>> This patch implements that feature and exposes it via the generic
>> ACPI battery driver in the generic location:
>>
>> /sys/class/power_supply/BATx/force_discharge
>>
>> Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
>> Signed-off-by: Thomas Koch <linrunner@gmx.net>
>> Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 59 ++++++++++++++++++++++++++-=
-
>>   1 file changed, 55 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
>> index 9c4df41687a3..6c7dca3a10d2 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -9317,6 +9317,8 @@ static struct ibm_struct mute_led_driver_data =3D=
 {
>>   #define SET_START	"BCCS"
>>   #define GET_STOP	"BCSG"
>>   #define SET_STOP	"BCSS"
>> +#define GET_DISCHARGE	"BDSG"
>> +#define SET_DISCHARGE	"BDSS"
>>
>>   enum {
>>   	BAT_ANY =3D 0,
>> @@ -9333,6 +9335,7 @@ enum {
>>   	/* This is used in the get/set helpers */
>>   	THRESHOLD_START,
>>   	THRESHOLD_STOP,
>> +	FORCE_DISCHARGE
>>   };
>>
>>   struct tpacpi_battery_data {
>> @@ -9340,6 +9343,7 @@ struct tpacpi_battery_data {
>>   	int start_support;
>>   	int charge_stop;
>>   	int stop_support;
>> +	int discharge_support;
>>   };
>>
>>   struct tpacpi_battery_driver_data {
>> @@ -9397,6 +9401,12 @@ static int tpacpi_battery_get(int what, int batt=
ery, int *ret)
>>   		if (*ret =3D=3D 0)
>>   			*ret =3D 100;
>>   		return 0;
>> +	case FORCE_DISCHARGE:
>> +		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, ret, battery=
))
>> +			return -ENODEV;
>> +		/* The force discharge status is in bit 0 */
>> +		*ret =3D *ret & 0x01;
>> +		return 0;
>>   	default:
>>   		pr_crit("wrong parameter: %d", what);
>>   		return -EINVAL;
>> @@ -9425,6 +9435,16 @@ static int tpacpi_battery_set(int what, int batt=
ery, int value)
>>   			return -ENODEV;
>>   		}
>>   		return 0;
>> +	case FORCE_DISCHARGE:
>> +		/* Force discharge is in bit 0,
>> +		 * break on AC attach is in bit 1 (won't work on some ThinkPads),
>> +		 * battery ID is in bits 8-9, 2 bits.
>> +		 */
>> +		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_DISCHARGE, &ret, param)=
) {
>> +			pr_err("failed to set force dischrage on %d", battery);
>> +			return -ENODEV;
>> +		}
>> +		return 0;
>>   	default:
>>   		pr_crit("wrong parameter: %d", what);
>>   		return -EINVAL;
>> @@ -9443,6 +9463,8 @@ static int tpacpi_battery_probe(int battery)
>>   	 * 2) Check for support
>>   	 * 3) Get the current stop threshold
>>   	 * 4) Check for support
>> +	 * 5) Get the current force discharge status
>> +	 * 6) Check for support
>>   	 */
>>   	if (acpi_has_method(hkey_handle, GET_START)) {
>>   		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery))=
 {
>> @@ -9479,11 +9501,16 @@ static int tpacpi_battery_probe(int battery)
>>   			return -ENODEV;
>>   		}
>>   	}
>> -	pr_info("battery %d registered (start %d, stop %d)",
>> +	if (acpi_has_method(hkey_handle, GET_DISCHARGE))
>> +		if (!ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, &ret, batt=
ery)))
>> +			/* Support is marked in bit 8 */
>> +			battery_info.batteries[battery].discharge_support =3D ret & BIT(8);
>> +
>> +	pr_info("battery %d registered (start %d, stop %d, force: %d)",
>>   			battery,
>>   			battery_info.batteries[battery].charge_start,
>> -			battery_info.batteries[battery].charge_stop);
>> -
>> +			battery_info.batteries[battery].charge_stop,
>> +			battery_info.batteries[battery].discharge_support);
>>   	return 0;
>>   }
>>
>> @@ -9569,6 +9596,15 @@ static ssize_t tpacpi_battery_store(int what,
>>   		if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
>>   			return -EINVAL;
>>   		return count;
>> +	case FORCE_DISCHARGE:
>> +		if (!battery_info.batteries[battery].discharge_support)
>> +			return -ENODEV;
>> +		/* The only valid values are 1 and 0 */
>> +		if (value !=3D 0 && value !=3D 1)
>> +			return -EINVAL;
>> +		if (tpacpi_battery_set(FORCE_DISCHARGE, battery, value))
>> +			return -ENODEV;
>> +		return count;
>>   	default:
>>   		pr_crit("Wrong parameter: %d", what);
>>   		return -EINVAL;
>> @@ -9617,6 +9653,13 @@ static ssize_t charge_control_end_threshold_show=
(struct device *device,
>>   	return tpacpi_battery_show(THRESHOLD_STOP, device, buf);
>>   }
>>
>> +static ssize_t force_discharge_show(struct device *device,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	return tpacpi_battery_show(FORCE_DISCHARGE, device, buf);
>> +}
>> +
>>   static ssize_t charge_control_start_threshold_store(struct device *de=
v,
>>   				struct device_attribute *attr,
>>   				const char *buf, size_t count)
>> @@ -9631,8 +9674,16 @@ static ssize_t charge_control_end_threshold_stor=
e(struct device *dev,
>>   	return tpacpi_battery_store(THRESHOLD_STOP, dev, buf, count);
>>   }
>>
>> +static ssize_t force_discharge_store(struct device *dev,
>> +				struct device_attribute *attr,
>> +				const char *buf, size_t count)
>> +{
>> +	return tpacpi_battery_store(FORCE_DISCHARGE, dev, buf, count);
>> +}
>> +
>>   static DEVICE_ATTR_RW(charge_control_start_threshold);
>>   static DEVICE_ATTR_RW(charge_control_end_threshold);
>> +static DEVICE_ATTR_RW(force_discharge);
>>   static struct device_attribute dev_attr_charge_start_threshold =3D __=
ATTR(
>>   	charge_start_threshold,
>>   	0644,
>> @@ -9645,12 +9696,12 @@ static struct device_attribute dev_attr_charge_=
stop_threshold =3D __ATTR(
>>   	charge_control_end_threshold_show,
>>   	charge_control_end_threshold_store
>>   );
>> -
>>   static struct attribute *tpacpi_battery_attrs[] =3D {
>>   	&dev_attr_charge_control_start_threshold.attr,
>>   	&dev_attr_charge_control_end_threshold.attr,
>>   	&dev_attr_charge_start_threshold.attr,
>>   	&dev_attr_charge_stop_threshold.attr,
>> +	&dev_attr_force_discharge.attr,
>>   	NULL,
>>   };
>>
>>
>

