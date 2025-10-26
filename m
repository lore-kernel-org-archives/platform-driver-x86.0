Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561DC2E8DFE
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505807; cv=none; b=hmEust0bKW67i50Tyr4xaa1r9ndq1jlbZh/EzoPMVjGm4wtsevjOyB62FrTyxthUiawl5qDN9/bRkEhVeN5bi2dNFqBamOE4GI9R7/hjPhDYXaDWnscViSMy5L6C7W5CCj0GwJlx78T/Jf7zp9E9bYdQxz7d22HDB4C6kF8plDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505807; c=relaxed/simple;
	bh=0lq7zVwPZaQ1Z0QmxvXwvIFsXJKsKrMtftkVUtORhEE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=L3+L5GkfQxMl1coqbF7RBmh3yBcqohFrHj3EecP3Xzj87/o92JEJoBdArrdZlM3IzyLaRSQvojL60nzCe2tsCwJWT7b6eUvrl5YeXa8+mwVELcsLfSZEfbWklT9tz96rgeoi4/PqIjQPIRbV2KbnMixOInNFbr506KJ66AEGnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULU3LZ5Q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULU3LZ5Q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso3327844a91.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 12:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761505805; x=1762110605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fnFYZ9YUqokdNrVhAzveB7Lx/h8vJ0ZLZBrXLG7FIwU=;
        b=ULU3LZ5QDucJoRHtdN4r5T2qvlQG/ptN219iohNQDg9o3S+ZEmuCqEOwU7absOBLYh
         q3IE8Zle/mINy94lD2fCyJvHl7Sqa8q7k9mxFQibFX6Bqv751DVk2lczqAZ7N0qhF8Xw
         K5q22x+K/FLPFD/5oQFHNVYgI264hMqb5BVxncTbrJXjvLJPt7Q98gPnc4GVxuabEFsl
         g2xjlYH+tSEC4Pc2toEXQRfwZ9cDe+iKVQLzrqtJX7XJGaJ78JHinAZhz09O/Q5VPI7v
         5FLXRauY85GvtYjwGijcr8p8G/cTQEGs0mg/qmvFbbn6WE01SDCuF0NeFKrJTS3NlmBR
         vpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505805; x=1762110605;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnFYZ9YUqokdNrVhAzveB7Lx/h8vJ0ZLZBrXLG7FIwU=;
        b=nAHgfFTDtXGuCQyRxbDi+pjJUfxHVO5/01h65uGnFFVDpmLREGHmsDzcl6cxPc45Hz
         Ws/56EF9enfO3dw3xudkPWiygY/xD/6P5IKowT85MW7B4gB2GZx4hwYYpvNVjKGr1SXX
         O3qaKWKWHoDu6R5iCQgXcAwtFUa8sw997lq3TNxs3V7OhwojTZ2ohcI9DNnletFmi9iG
         mIAoeBGTLNo9FQqE6rWR/bRcwICbM46FJ6uLCR8XBUbE8qVYZS5JMUppYTDmdLO3nKxq
         ZXJu8yh+LdaNB/6T5uRlfgv4vbZwRY8hG4P5Sfnjs4y24J3bxh1FftqqFE74SvGJOvzH
         Ul+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo+/ta2akHmXx2Y3slgfdEV20xZVMj1bIDG3GtF9MYdLtDWy30N/vU8aQ8T+dSJpMZMzTzIDzuywsIWyDuzhJnsDu0@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTQPsTv8FmMS3+eEWjD792gJm4t+xsPZnJruz3sH7ucJzUydW
	prBhZLIp2hi5gQxyiuAzCoH936SVK9emrkkLaOEZL7qDYK+NVNtrIot0
X-Gm-Gg: ASbGncu7RfPcvL3qZcQwXmoYfKReASMbDmSNkbIz4A1dTZR7/LCcZPJa5KHi/Y38K/L
	LNCS9xqbRFy0/25LRPUGtoECRO4F5XD8au9AwRTXEoZEw15snJPPcYOd8Bbg0NHje0vROc6o6eI
	pI1G1sORAaW6dmpf15ZoFNHzHqIhjS1hkoa5sPC5Dv0nFVq1I/2Y7y+lHxUAOVEDfmJ/ruDv2rV
	IE0pUAhBakT/87R55O3LqAtNInCMR2l9NmGQ4O3nQHgBCCklp3ns9mGsIU3sZ09pgO/Ru1wjsPh
	yEFIrMz4aGJYq+K9zDu/9elv5d6gQawxxwTxsyfWa2e/7VGGaYstU91wg+UWRDXxnB/wus4IQ0q
	U4p+tUENz5/yq0PI2Qa3XXO/QgCQwxuWngdOPnwpC1kSB/ZhkLmVSmSN+nwEIltJCnFQ+ceDcDE
	h3TBzPoGL/DSq5HHtoKFpVcrfZtofYn4HkJ1QRJlzbJhs5yT2eE2zT3dzO9gW8FYo9LjkXnefHF
	pk21r9YUNydZYsnFv4l
X-Google-Smtp-Source: AGHT+IHIMcsGGm24Rt7x4qUBaUlLuW2TkTj9Vx3KclPFhSEmsfRY9ycNQeSpu5npNrhMtA0Tz3+PdA==
X-Received: by 2002:a17:90a:ec8b:b0:32e:d011:ea0f with SMTP id 98e67ed59e1d1-33bcf8f7280mr40460828a91.25.1761505805426;
        Sun, 26 Oct 2025 12:10:05 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f3aeesm5818053a91.14.2025.10.26.12.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 12:10:05 -0700 (PDT)
Date: Sun, 26 Oct 2025 12:10:03 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mario Limonciello <superm1@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Len Brown <lenb@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>
CC: Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/3=5D_platform/x86=3A_lenovo-wmi-ga?=
 =?US-ASCII?Q?mezone_Use_Extreme_vice_balanced-performance?=
User-Agent: Thunderbird for Android
In-Reply-To: <e8789ef0-1700-4f1b-95fe-95dfdbc1e785@kernel.org>
References: <20251026081240.997038-1-derekjohn.clark@gmail.com> <20251026081240.997038-3-derekjohn.clark@gmail.com> <e8789ef0-1700-4f1b-95fe-95dfdbc1e785@kernel.org>
Message-ID: <C92AC0B4-8458-4D2B-AE5D-9D452294EDFE@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 26, 2025 10:52:29 AM PDT, Mario Limonciello <superm1@kernel=2Eor=
g> wrote:
>Is 'vice' the right word for the subject?
>
Used as in rather than or as an alternative to, it has more brevity=2E

>On 10/26/25 3:12 AM, Derek J=2E Clark wrote:
>> When upstreaming the gamezone WMI drivers the "extreme" mode was matche=
d
>> to performance and performance was matched to balanced-performance, but
>> only when extreme mode was fully enabled=2E Otherwise performance was
>> matched to performance=2E This has led to quite a bit of confusion with
>> users not understanding why the LED color indicating the platform
>> profile doesn't match their expectations=2E To solve this, replace the
>> confusing convention with the new "extreme" profile=2E
>
>Are the colors common to all devices?  Maybe it would be worth adding to =
the documentation the expected colors for each mode=2E
>
I think so, based on every case I've run into=2E I'll need to expound a li=
ttle and reword more in this section but that should be doable=2E

Thanks,
Derek

>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>   =2E=2E=2E/wmi/devices/lenovo-wmi-gamezone=2Erst        | 10 +++------=
-
>>   drivers/platform/x86/lenovo/wmi-gamezone=2Ec     | 18 +++++----------=
---
>>   2 files changed, 8 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst b/Docu=
mentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>> index 997263e51a7d=2E=2E6c908f44a08e 100644
>> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>> @@ -24,18 +24,14 @@ current platform profile when it changes=2E
>>   The following platform profiles are supported:
>>    - low-power
>>    - balanced
>> - - balanced-performance
>>    - performance
>> + - extreme
>>    - custom
>>   -Balanced-Performance
>> +Extreme
>>   ~~~~~~~~~~~~~~~~~~~~
>>   Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" prof=
ile
>> -enabled in their BIOS=2E For these devices, the performance platform p=
rofile
>> -corresponds to the BIOS Extreme Mode, while the balanced-performance
>> -platform profile corresponds to the BIOS Performance mode=2E For legac=
y
>> -devices, the performance platform profile will correspond with the BIO=
S
>> -Performance mode=2E
>> +enabled in their BIOS=2E
>>     For some newer devices the "Extreme Mode" profile is incomplete in =
the BIOS
>>   and setting it will cause undefined behavior=2E A BIOS bug quirk tabl=
e is
>> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone=2Ec b/drivers/pla=
tform/x86/lenovo/wmi-gamezone=2Ec
>> index 0eb7fe8222f4=2E=2Efaabbd4657bd 100644
>> --- a/drivers/platform/x86/lenovo/wmi-gamezone=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-gamezone=2Ec
>> @@ -171,14 +171,10 @@ static int lwmi_gz_profile_get(struct device *dev=
,
>>   		*profile =3D PLATFORM_PROFILE_BALANCED;
>>   		break;
>>   	case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
>> -		if (priv->extreme_supported) {
>> -			*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
>> -			break;
>> -		}
>>   		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
>>   		break;
>>   	case LWMI_GZ_THERMAL_MODE_EXTREME:
>> -		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
>> +		*profile =3D PLATFORM_PROFILE_EXTREME;
>>   		break;
>>   	case LWMI_GZ_THERMAL_MODE_CUSTOM:
>>   		*profile =3D PLATFORM_PROFILE_CUSTOM;
>> @@ -218,16 +214,12 @@ static int lwmi_gz_profile_set(struct device *dev=
,
>>   	case PLATFORM_PROFILE_BALANCED:
>>   		mode =3D LWMI_GZ_THERMAL_MODE_BALANCED;
>>   		break;
>> -	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
>> -		mode =3D LWMI_GZ_THERMAL_MODE_PERFORMANCE;
>> -		break;
>>   	case PLATFORM_PROFILE_PERFORMANCE:
>> -		if (priv->extreme_supported) {
>> -			mode =3D LWMI_GZ_THERMAL_MODE_EXTREME;
>> -			break;
>> -		}
>>   		mode =3D LWMI_GZ_THERMAL_MODE_PERFORMANCE;
>>   		break;
>> +	case PLATFORM_PROFILE_EXTREME:
>> +		mode =3D LWMI_GZ_THERMAL_MODE_EXTREME;
>> +		break;
>>   	case PLATFORM_PROFILE_CUSTOM:
>>   		mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
>>   		break;
>> @@ -338,7 +330,7 @@ static int lwmi_gz_platform_profile_probe(void *drv=
data, unsigned long *choices)
>>     	priv->extreme_supported =3D lwmi_gz_extreme_supported(profile_supp=
ort_ver);
>>   	if (priv->extreme_supported)
>> -		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
>> +		set_bit(PLATFORM_PROFILE_EXTREME, choices);
>>     	return 0;
>>   }
>

