Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532300;
	b=0P/yev6zNCtdiCHqKas1CytuP6c55kltnHhglRwWvYFbxs8FX7leMBGigShUSh1eiDFi
	 YdU4Tw+3q7k2r+mWqq92wvo6xo7VvOGLZW5Qsg11L3qweFulBXAq/27lobjnXpqExNjn0
	 UbvoUNmHmfDeHMsdCnodjXad9XmSnstPRdlgSorpR19HNassHGn9DO6OSuE95QXbYTcWl
	 gDvwdgptEHrkF0pKhUbLk93beV04S0MBBYV23UoHS9tC/Bj0/5fTEYpzyj2GmT9xe/9fR
	 kLSP/Z4spzbGrqiseO+BSAOJ2kPFUdxUb/OZhkokxPTp5Wn+5woD5eQF5vBQbQpUECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532300;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=nw1HJ1rYH0om1Cll57QBh5/myBqA0mV9sEjrJO/Tvyw=;
	b=jDzvl+xbjiCkBWhvr4EcrfVJ4iOeOYTyeOk+EUwTgSovt/OQ/JCzUke1xOEghdO5RRz0
	 atB8rMXAWj32DzH5YKQsXSsRAIYhDuQD0hxzx+TOKNu7oqz1Eplf7FGW1EFx+5UbUGZbY
	 uj4rWdm/Xm4arPMY3mYiC+BsR0raCUMFSkIDjzhD4BZBEwKWAazWkB3Jn7DW5XqwI3d4p
	 tI5fhFlCZh8/hII3foubMa/Hzw8pobBE6n85XMO5GZyrsZLRlI1iNTV28YxtZqw1tYbgY
	 IMHPZ/qqKYPAOaROAXIHwnFkAI8H4mq4K+MpJDlRaTZ/gru8GJtAe7t+0aaqRNIoCBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ioD1yLkd;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A489606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 14:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A489606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ioD1yLkd
DKIM2-Signature:  i=1; m=1; t=1795532297;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:BvXXl1133J1uh0DTDhDA2ORJt2kQ
   dURhZAOdFmFcWt4eIUYpJ92xz+DB48+KXE1Lvjj0+uojAzW/K6UWP2XOK6UwicsAJ/UfKnNEs0O
   9LpEHPvG05Bc6WE/3Sx7nowhhUgzJMoxdH7NwWKfWLGgIX5MhgOzzDyLwlVVg5kUKhBnTR59O5e
   8um34mr/LNi8B6TriUE2Xgkb+3YGHZb6jxTUzqkUIfO76v9JgmqKTAM1tiCZahr6WGzXcRCZsRj
   8mJflIj78cf41zJHKmEFQ6UCOzgW8jEz1TAkneAZveTruJ5HHYceCIGsrDjDf7TeFCmlUSAxHGF
   SxmvVWNMhnT8GA==;
Message-Instance:  m=1;
 h=sha256:
   FuIrUOKldo05j14qRYAbAwspo+pkP97aPw3FzVECCSc=:
   nw1HJ1rYH0om1Cll57QBh5/myBqA0mV9sEjrJO/Tvyw=,
  sha512:
   GS/O3MxWRF+5DN+MMFHyfYiDzg7EYm2uUHfNsH7dmIYZlKKnQWf6loF4WilWvceVvRPQzwWzbcH7vX4n2MvYQg==:
   oZ37l+6+9++RQfHjgJ7f8I697CnZxE4rs4SLku24WhlrafKrrXVbr5k6WEk9fQs5/ckVmr+BWmQ+FQ+DMYfRZQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795532266; x=1796137066; i=w_armin@gmx.de;
	bh=nw1HJ1rYH0om1Cll57QBh5/myBqA0mV9sEjrJO/Tvyw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ioD1yLkd2R7cXGQWoxHP5HSNxVMR8z/hC+X04KTy7/JB7CX7OEfsHkN3IjzCs1Zs
	 ax4X8djCZ71xLw3V+DUR9zHZReSrGrb9gp8QxZNSDdB80niWpuAyfH3Wn8fw646Lk
	 eb/wDXy6mAqJ22xOa4kakXX9wTQXcbcWF6AVWoYLHCVvfeVnL+mcInqDtGZ5eFp+B
	 FyfemEerGaDxr10zbGf+Z2Xgfy5nHfnYe/kAlUmWQbc6/RIzb7uFLRtO/OdZD6O97
	 j8ngdJLyi+Ubk8Qe9nAjRE+bB3OIDzt3nvQT/3OQsa0CrSbQ0gcOUNkqcCcjqsFHC
	 KNYJplGI3CZkB6MnvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhhN-1xdo2n0nUV-00GFLG; Tue, 24
 Nov 2026 15:57:46 +0100
Message-ID: <a851c757-3110-4ecc-b920-a98736b190b5@gmx.de>
Date: Tue, 24 Nov 2026 15:57:43 +0100
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
From: Armin Wolf <W_Armin@gmx.de>
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
 <12ff3c7e-0425-42ea-9994-69f9d56a4591@gmx.de>
Content-Language: en-US
In-Reply-To: <12ff3c7e-0425-42ea-9994-69f9d56a4591@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ld8ZVesk+gj1QBy8nsMrbZb2a2UaH7Z4WtfF1PRjh3zadifidaN
 5uQc3S379qzEyMm8TjFyAvUaYH6Gn3lSF3xr75cPZ8FRpUocyBoOFzXNLSi435bXyZMBPMn
 dsOAGnD/slIWRVGBBAgMar/JHcqaGLRGkFVMgwZjQjHq6FZyn55ux2si5GjS2mlCEPluN3Z
 A17vFwVXV3Au3qvUwpgeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mERlOi2wNA8=;dEloxCMpmtFyqni2ri7PxK87ngD
 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

Am 24.11.26 um 15:29 schrieb Armin Wolf:
> Am 24.11.26 um 00:43 schrieb Brian Mak:
>> On 11/21/26 05:49, Armin Wolf wrote:
>>> Am 21.11.26 um 01:05 schrieb Brian Mak:
>>>
>>>> On Dell RTX Spark laptops, the SMBIOS calling interface completes eve=
ry
>>>> request with an all-zero buffer, even for requests that should fail.
>>>> Drivers that rely on it, such as dell-laptop and dell-pc, end up
>>>> reporting bogus state, like battery charge modes and thermal modes.
>>>>
>>>> Add a DMI quirk list for platforms with a non-functional calling
>>>> interface, and export dell_smbios_calls_functional() so that consumer=
s
>>>> can avoid loading on them. dell-smbios itself still loads, as dell-wm=
i
>>>> depends on it.
>>>
>>> Hi,
>>>
>>> do you have access to such a machine? I would be _very_ interested in
>>> the output
>>> of acpidump on this machine, maybe this could be an issue with ACPICA.
>>
>> Hi Armin,
>>
>> I've attached the acpidump.
>=20
> Thank you very much.
>=20
>>
>>> Alternatively, maybe the wrong backend get selected. Currently the del=
l-
>>> smbios-smm
>>> backend will try to read a specific token in test_wsmt_enabled() to
>>> determine if
>>> the WSMT ACPI table is active. This might not work on arm64 machines, =
so
>>> maybe parsing
>>> the real WSMT ACPI table would fix this problem?
>>
>> dell-smbios-smm is not available outside of x86, as it depends on
>> DCDBAS, which depends on X86. It would only be using the WMI backend.
>>
>> Thanks,
>> Brian
>=20
> If i understand the ACPI code correctly, then it seems that the WMI=20
> interface interacts with a OperationRegion handled by the ARML0002=20
> device, associated with the ARM FFA interface.
>=20
> AFAIK the linux kernel currently does not support this device, maybe=20
> this is the reason why all SMBIOS calls fail.

After doing some more research it seems that the associated WMI method
tries to call a ARM FFA service using a FFixedHardware opregion.=20
Theoretically Linux already supports this, did you enable CONFIG_ACPI_FFH?

Thanks,
Armin Wolf

> I also noticed that the device supports the WMI interface used by the
> dell-smm-hwmon driver. If you want i can try to enable this driver on
> arm64 too, but IMHO it should be considered optional at best.
>=20
> Thanks,
> Armin Wolf
>=20
>>> Thanks,
>>> Armin Wolf
>=20
>=20
