Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530580;
	b=rkw0FO9nIIXqSvjBuZriGRN0XqjbvLDCZpjuL1SeWYjqHuVvXnsK1yScBI3xPejnYrYe
	 CfuvGgoeHverCxjrtRfhzPLYnjAKjX2EqEGrN3ey+AfdGo70g/xBb3Rrp4yjEiwRpJy4j
	 /yl0b77FcfHLbxuGhoLFNA2kXVKt5tsBOLEyiNp0kQwCrT1o2lacJ8GxmpDfo1Fi9ytDv
	 82o9xmbyB5Lfr7EYhL8Gk+zEN96DRH6IueEwDB3XMVf7Vxmzv0rNjubYC/atgLk3StTu6
	 LkSgEtsi8j3e/UaCuEXEMETl3NAosWUXbWjljRyNBsdEsFQgROPbGaHoKmU9JSom9Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530580;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=DI+a4jIfe5CnQQI4pwwiI7gpDuiZJ97mn1WUEUkdeOM=;
	b=fx+mZ/z/mDtb864xk06n4G2wxBXGETpdLynQgNx7QwsCfuVVPk6scD5W5mVNCOffdTnt
	 W9gPJ9DxIU7m5PA775jMmjRFb9VkToPjnysCIJRednKN/FX0Kej8tjKe61EKNHLSqG9sk
	 xRqukUwwGeECMd+rdSsMUKMWBrVKE8rWS0qkhJwxkf6xsMTVQSyqy7j+sXTmRwFkHBmbU
	 qyrszqv6JbS+hm8sMRpF9VTNYck94Qx+z9bHUC2S0AWi8gJ28glxL5sDJBDdxYHI/WjMp
	 akNQVOxwN7vxyhDkLllilUTA1cRMeQdi2yIbtYNEpQIKmb7SDUvF1b71wqVCzLL81HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VX+kBW5D;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009F606A33C
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1009F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VX+kBW5D
DKIM2-Signature:  i=1; m=1; t=1795530578;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:ZeIXtSUASn9+G3mT+jZKkfNJYxX1
   00mpQwIma5ClCRS9Iia7Fui85sWLQn0SVniDg+h/u/F8fASLxZbiAD8uzPSoGmDNauwisA31eKo
   T92VT3EySkWez9Nd28rdfw417HoBLZwLDfOQEciBiEbQIpPtPo7U3osWV4zhhg2jp9nkdJpAeM+
   XiwSKCbuJn6zQAPkB0bzi7RpA0oqa9ys/15VP0BAySwUt7RIy1JdqsiUKkkPDwpLhVlKaC92Mz7
   FnBRb/cRNp6lqNPgeJxwq0VDGRNm69uHxm7Pww9thpEknPs5wWWypy13oM/lhoaDJRvPYA8bE16
   34NnfNtSCw4VtA==;
Message-Instance:  m=1;
 h=sha256:
   QjDtxW7QPICaGRGf1D37OGhF9jStnWEEhK1aVsPVAbY=:
   DI+a4jIfe5CnQQI4pwwiI7gpDuiZJ97mn1WUEUkdeOM=,
  sha512:
   Xps67wr/KGtKNaKKXf3sb1rVj63Ar8iLf0dqRzWkKgR3SqBN1ENLUCMja2Ic6MYLX291SSPOd995n/za/Wr1sQ==:
   wVu/XvlOVGcIxAZx2LCwECkVVZEXPBkZj806eA+R8Vs9TtwJyGEak1W+XvfQOXPMaGDvG/W6tPAHTBJZ+n70OA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795530566; x=1796135366; i=w_armin@gmx.de;
	bh=DI+a4jIfe5CnQQI4pwwiI7gpDuiZJ97mn1WUEUkdeOM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VX+kBW5DVD3DLG/bK79lwOld7LI1e0SlXHciu+V+GMW5oxVTHT9sstna2IEF/If4
	 nki+aGzmF/UP7OHkAaEV6AFjkc5O7Oxp3BZFVxSBx5VC7G2kNIvrvZoM6Pge3FGo3
	 8qMeQl8+kZpzEw1fZDGhUVBqvDupqsc5CPAuVpfgLfsEB4yBgYzJoQR6tvSMcSpAH
	 MATBLlfr2B63TmhW+YuHS8PgnwFVWEc4A4Phh+eyXKc6PSov+urb53DY+1Komdfdk
	 FJcqvzzZrKlbNe9mA1WaK91ynC3mZxXliP2lyJW7/jJ30KjY8hPM/bytOiiphMyNp
	 3C9/sX8ut+1oWxnGGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1xnWth3PnM-00PQHT; Tue, 24
 Nov 2026 15:29:25 +0100
Message-ID: <12ff3c7e-0425-42ea-9994-69f9d56a4591@gmx.de>
Date: Tue, 24 Nov 2026 15:29:21 +0100
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
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
 <f3dc7e25-9c22-4b1d-9555-e83db82d05a1@gmx.de>
 <792a7fdd-b2a0-4a2d-88b3-7aecf1af3d7c@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <792a7fdd-b2a0-4a2d-88b3-7aecf1af3d7c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SVLLjynhMaqgPmtLuset/ES6aexdAN43xQs9S+W/vioo9REYxLw
 Ny7UhmNDYtpHh3FGxiQOnD6eUlwyyjt4Cv+W7KWAknRdMG+rKsBEYOet8vbVOwjKSqOCYNp
 4ndEwNzISAng4kQgcW5285xKjWtOlLstNyIHUWoe12gls/titxoxHNjXUcF1/HrT0X0ElDu
 qtvicAEjWWq72RZWSr7YA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eQNXhmjlv7M=;e50dZ7nrs5JL2WrF0yJFNa1RgWF
 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

Am 24.11.26 um 00:43 schrieb Brian Mak:
> On 11/21/26 05:49, Armin Wolf wrote:
>> Am 21.11.26 um 01:05 schrieb Brian Mak:
>>
>>> On Dell RTX Spark laptops, the SMBIOS calling interface completes ever=
y
>>> request with an all-zero buffer, even for requests that should fail.
>>> Drivers that rely on it, such as dell-laptop and dell-pc, end up
>>> reporting bogus state, like battery charge modes and thermal modes.
>>>
>>> Add a DMI quirk list for platforms with a non-functional calling
>>> interface, and export dell_smbios_calls_functional() so that consumers
>>> can avoid loading on them. dell-smbios itself still loads, as dell-wmi
>>> depends on it.
>>
>> Hi,
>>
>> do you have access to such a machine? I would be _very_ interested in
>> the output
>> of acpidump on this machine, maybe this could be an issue with ACPICA.
>=20
> Hi Armin,
>=20
> I've attached the acpidump.

Thank you very much.

>=20
>> Alternatively, maybe the wrong backend get selected. Currently the dell=
-
>> smbios-smm
>> backend will try to read a specific token in test_wsmt_enabled() to
>> determine if
>> the WSMT ACPI table is active. This might not work on arm64 machines, s=
o
>> maybe parsing
>> the real WSMT ACPI table would fix this problem?
>=20
> dell-smbios-smm is not available outside of x86, as it depends on
> DCDBAS, which depends on X86. It would only be using the WMI backend.
>=20
> Thanks,
> Brian

If i understand the ACPI code correctly, then it seems that the WMI=20
interface interacts with a OperationRegion handled by the ARML0002=20
device, associated with the ARM FFA interface.

AFAIK the linux kernel currently does not support this device, maybe=20
this is the reason why all SMBIOS calls fail.

I also noticed that the device supports the WMI interface used by the
dell-smm-hwmon driver. If you want i can try to enable this driver on
arm64 too, but IMHO it should be considered optional at best.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf

