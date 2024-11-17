Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07241D90D4
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731860680; cv=none; b=M4jITbp3Z3GWetm94sR4zl+NEqgpPD6LkGx+UDlEoAEzw/0Knk9Yqtt0S7KTXuj/WrtyL/zqnKLPcZ46ilA8Qd7Lb8RlnN0ROSvaIkI7Y2t9Y5bEaRWND5YoF8uI0pOt7M2Bi/NrRQWeEgMwVoi/86F4bpEicJPQ8e6hz2OEpr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731860680; c=relaxed/simple;
	bh=CmzhVCKsdGipOEXqGRP+ReXu5P0tEPye5xNwCOpA+08=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jwC0Zm/pmkAJOcnKg81coSvTRHuaGW8rWrArt5PAAMoCqFG+fz4vDSuQvVFynD3TXsmRkMjAdbBpWahsDscJHUT8LcZ9bz7v2pHFUTiRGjTYnNfugzM28SezkNGk1LJsxBsLnH0b2xKRfJv6m7tHfepS7z1dgeiHTs6fdmXYciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=O+LdBsRa; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="O+LdBsRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731860675; x=1732465475; i=w_armin@gmx.de;
	bh=CmzhVCKsdGipOEXqGRP+ReXu5P0tEPye5xNwCOpA+08=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=O+LdBsRaouJO4FcbkFkpWANooRWPX7GF/6MCVqGHhY/Xyl+DRYD6XJ4YsTWxO3eM
	 fDa0aiHrbleYkjGVTuTqc1u49RIwQxK14FNJNRzhuNbBlwHu0GuzvbYIwEDkvG7mc
	 YINZFe5GhV4XRIjJcBptVMrSukYwH7w3zXhq/eI9RE8M/VlsWARLx71C7TkbWAyWr
	 Q1IlNhrfz5gkNfJkv5dLhIZ3rWuDBjAQJn9kuRi2TdhteloxW3YUsgOsmdNS/3UHa
	 lGMw5ZzynBD4TM6L5yGVs+7YyFpbHJd4bA9Z5vWmYvCyNI4Ocfa9j3vLviBUwBCUy
	 VIY2Oz7g/c8tOti6kQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1tWedP1Oci-00c0rq; Sun, 17
 Nov 2024 17:24:35 +0100
Message-ID: <30d3dbdb-9477-4d4b-bccd-2584ff092308@gmx.de>
Date: Sun, 17 Nov 2024 17:24:34 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
From: Armin Wolf <W_Armin@gmx.de>
To: farhan.anwar8@gmail.com
Cc: platform-driver-x86@vger.kernel.org, rayanmargham4@gmail.com
References: <2ffb529d-e7c8-4026-a3b8-120c8e7afec8@gmail.com>
 <ba283df4-a0ed-4759-a8b5-384666f1a5c7@gmx.de>
Content-Language: en-US
In-Reply-To: <ba283df4-a0ed-4759-a8b5-384666f1a5c7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T9t7XSeQXfL2NpGn7yBOVJyrUxljwpq8Lef1AG9AdR1yKstlQlC
 lPF9q/pD+GbUOIrpGn04590NtuATVs+f0KzBSJ/DpijjWdeE1ENZHSEq4YldAcMaqJM7XJi
 LTVg6mdjUWo1okU1xMqMllRxc+uypEuAbKHil6dRBtKFUgf+1leWDDAlDWfTX/oUZ+Abek4
 WjzwXLRLqorrYunkHtPJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Sf54IEOBBhg=;84ZvJcmW/hJAQN7/A43BsSgK8cZ
 MKfODxOohcJU5rsEl4yz3nRK0QWgfKoOs8aWMm+tgV5ybNr+ZnqCUZ0z6P/VBnbGzYR5LCNHK
 IitulYAO/zKrM/6WROM9StWwqUOPkTmp3Am83DrS3RnJsO6YgsrhD+KXpkqZ+Sjs8YlqHTcSV
 1OquIrqz5bvhnuCbZrg180FQs4k8vBwkLgf63uY3U/tA1Du2zW+VimNmIPzciEESt8KgpaXiJ
 SYy/ZF8pupOk+xby6L4vlGWBJ0Q9FHACachBinRCPqp/F1kiiVYVTtoGG0m8nwkm/nRK5Ls+Z
 pSwwZ54qHCYWeYTWqqtCATYXVyDb4RAsYtKUukaHTppZWro7lv7EXCoQq2mZM2ISkLo4uvh4u
 FCWpzdQrVKIgeRS5NBU4CuwYfLG7+yI5Ps2bpgT46dfyC8syj9klGVIt+MbcCmtDH0QYgBRZR
 nb+hAppFDVynf/kc5UW4/BZO23ZyBxTUKJelGt3o6bWx9ytmOQq1OJsv+ya0G/tzcWx/KAWmJ
 kBkiLdKHOmuzCpchH/pm+4rr/IU17pWDmdyGBkH6SLsF/DGlEMjT6Va/YundiV9y3RDqzqOOa
 hyvJT5BKZsNkElA1k51cBN4v9fILmHEBHEE8RxZeIn8nlqNy9UBCBqhEjsZXVMi9bnFz35vBO
 WRdZft+cIi/tOGexnDcASa8hWXZGsqWFBNjUBJjsefiL5h1Hi269PQNHB0BnxpsEPODaiCyT6
 +XVcFvhYZaXrs5tsSHkdB/N4JndY89/JajxT9rInF9Yp5bd97ZraqX8iKC+oOogQBJV2b9mFL
 oe+rEpN4pse1ooT4KXphBjvRoFb49tOPkNcTQY/qSiCRqFSlFSXGSUKHvymu2iti61GJdsS6P
 QYqHXWTDlVuaDvCCW1jD63CD0HwpXQjzpUIZayVCona5caO16JGph5HXh

Am 17.11.24 um 17:21 schrieb Armin Wolf:

> Am 17.11.24 um 08:45 schrieb Farhan Anwar:
>
>> Although I'm using Swift SFG14-41, I have noticed the same events on
>> my laptop as well.
>>
>> Connect AC adapter=C2=A0=C2=A0=C2=A0 : acer_wmi: Unknown function numbe=
r - 8 - 1
>> Disconnect AC adapter : acer_wmi: Unknown function number - 8 - 0
>>
>> The event for disconnection is printed twice.
>> I've also noticed following message occasionally along with these
>> events.
>>
>> workqueue: acpi_os_execute_deferred hogged CPU for >13333us 19 times,
>> consider switching to WQ_UNBOUND
>>
>> Kernel version: 6.11.0-9-generic
>>
>> Thanks,
>> Farhan
>
> Those events seem to signal a AC connect/disconnect, so i think it
> should be safe to ignore those events.
>
> Regarding the warning: it seems that some ACPI Notify() or GPE handler
> takes quite long to execute, so nothing
> directly related to the acer-wmi driver.
>
> I am currently moving and thus unable to access my dev machine. I
> already prepared some patches for the acer-wmi
> driver, i will send a prototype soon.
>
> Thanks,
> Armin Wolf
>
It seems that the reply-to address was wrong, sorry.

