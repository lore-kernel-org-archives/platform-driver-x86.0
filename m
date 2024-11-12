Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FF5D477
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415907; cv=none; b=YKi0fWqfOLUptgel494xJvhCOm34BD779uvTIMXs/NhsZnT1gzb6yFRzWeH4/pGwWoaHQpRH7GRBby2vrFvfYXTegTC1GZMFC5XqbzgAMVu3IsZTpQ6Pi4A8zmZZFOPSDo1W4VpxDYJ46Qus+kEaZPEec8YKuVix/piC75a/TT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415907; c=relaxed/simple;
	bh=tdWsbFD8JiAObxkRnmAZa+YhHNI6F/4XDwg2lklexi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dPgbObTPREMxeS+asBCgZv2bSeZAOBwrvvhDN7SGAQPNqPzEjWa28APB/08qwpWFZWgvfEI+ql7Li3df4PJnTXjbuWwrMuvD13mE21t25S17yrDUx4zYodN5IKaCJ2XovIAaVn/BCknSyk0wfVNwIShwSWOZ1rae7IA5/5p7VXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MRk51YkQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MRk51YkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731415901; x=1732020701; i=w_armin@gmx.de;
	bh=tdWsbFD8JiAObxkRnmAZa+YhHNI6F/4XDwg2lklexi4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MRk51YkQglU3304Ph/GlF6f5yYjxqzD/Zdijci31qYNPzOYa/0MNgEWm+BbvHlCj
	 sZHJi4wYmA8aB0uOkboG79+Gxw7jgUrnPCPiGEM3HKgxFUM2F73NUzyiDZStOG37V
	 ccNGfeqdI7dmzUsIAM1ZknMpoCY7fer9UNuUC2xQQfTKhvoFzwx+FLH5Cow2saldg
	 IQnD6CPZ+aHrBAV1Y+jYGwZKO/1QB2KiZCFe/2VN1BoP0zcRWCQAL3xQqz7sQ8Uos
	 U4jsZLaU1/2Yco9smnSujzR67aVWJ6Pbg0SK7ZnxY1b7XjhaZsvHOUBduCTC1IeiF
	 2Sw7lE7CciO/6w6YZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.87.225] ([141.76.181.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1tju4S28xd-00hHZ2; Tue, 12
 Nov 2024 13:51:41 +0100
Message-ID: <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
Date: Tue, 12 Nov 2024 13:51:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9Y/PU6lWmGAMLLQnJjpl7mf/VDg9r7zhgrdexYIY2EfzLTtH8Xj
 C5ahBZkr9xaQ7mgMVyC4asunvvdKebzMu8hpmq6BxXaoQ7ejobDkv1/dCiJ9r+NBAS8h23T
 Lh4u0E9BUptJbfyhGSVksJff9BhI/tRuL/yMw1HPg774STd77aMLzlUo04zfD3cHUeDru2p
 y0QC7oHzyAal+/Llk90bQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OpTixph6Rz8=;osbZaojoZ3CXqdk25aECWODDHdI
 Opp2Wfu7DUZ6ZkJt57ovZ0X519G9fh6jCMcHHgiNcZGry+HzL6REs/4teBZkSRJctEFBok2pu
 A78Brpkzephe9yOhsqCSvr2mq4swv6WxZkFAmHqEplMHvo/TJOeYbo2XzixtxWnwblmQAwrZd
 369h7zOjUyb1n1X+tQNKa0tjaeabt+BE57mloIZZldGeVBzgmhPMNOY6FOj8xhogy2fRb7ulP
 GktfxQvJY3VFjai+Ro+hK/aGsAJPahRYl0jQPcOMBfc2d3JF1i/Zv6iaxt0vFRghGyHdrSHGH
 qZi0vtcMuBWv7vpYCJTbegzkDKt6F0ifbWPH8vyEmt0S8/iOmMkC/ZNzrJj9BhchKj/uIsTeJ
 ZKxrkHw1H5VWvDDHhHXsvSOWMDfkznJTluNO+09zq4B9YXzWWT9QXldPmo27n3USIVtg59RjI
 2Wzulg6vJIB49P0/bFmqTxTsEq1CUU3xXdc0DiJbZIJNOwu+7MtIIoxJ5DohaxdFKpGhZzIcu
 nsT+zP4iIEuiKtvohoRe/S3jkIQG4gY4OJdkb690Yst7gYQYn/2wxpbawbzXQPlpdoza0zisJ
 sexEEZw3daAU5AV5delwBBu+OSo/DBmSiU47k5KPGL8MnWRdIooh+BNdFetl7C1XWMESyp/70
 n6RORadRt/3KEA8xSfkdQG9i47/kLDTjmURLmEZQFL30M1Wn+AT4VxiAIzB0Y8kUHPVYp/ke+
 77RjJP4j6WCjutxSoEh+GiIa+2T9A8mG06tNHthUrJLAjx4ndYo1fKH0S0i8Oz/sAbmBKI7x1
 Y0IwRH1lz5sCRUpW8n+iuyfw==

Am 12.11.24 um 13:42 schrieb Werner Sembach:

> Hi,
>
> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>
>>> Hi,
>>>
>>> quick learning question: Why is wmi_bus_type not exported unlike, for
>>> example, acpi_bus_type, and platform_bus_type?
>>>
>>> Wanted to use bus_find_device_by_name in an acpi driver that might
>>> need additional infos from a wmi interface that might or might not be
>>> present.
>>>
>>> Kind regards,
>>>
>>> Werner Sembach
>>>
>>>
>> What kind of information do you have in mind? wmi_bus_type is not
>> being exported for historic reasons, i can change that if necessary.
>
> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has
> a slow wmi and a quick acpi interface, however the quick acpi
> interface can not get the max rpm of the cooling fans, but the wmi
> interface can.
>
> Thing is for the acpi driver we might plan an earlier upstream date
> and it might get multi-odm support, while the wmi interface is and
> stays odm specific. So my idea was to only couple both drivers in a
> dynamic way using bus_find_device_by_name.
>
Interesting, how is the ACPI interface not ODM specific? Can you elaborate=
 a bit on how the ACPI and the WMI interfaces work?

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
> Kind regards,
>
> Werner
>
>
