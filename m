Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFEA95C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135260; cv=none; b=fl+FQpmYfIOrsEcT3ulmeG4817ZUaVJJXdv4njIrxoBxbpvc+TfUTWUky2LJi28PEnZlqmTZvMp2jbhdE690hIpHbqpaOVNHSvtWcSpdmij1HxGQpFWcTWvux+szdQhHlp3RtPhWC4Hf2aLaWf1YQwii9NBNp1SLkTBIYtZbnRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135260; c=relaxed/simple;
	bh=bZm/lr/owfl9oGDLKV8iq6pOsMDYdZDVD02QeYjOc6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajCtJ2C/L989YSF9tG3j6aEvMjVsw1llTzE5TLqaVyIliQmlToGibNbP8lXSSmdduOkIEYSWYYYL2uURHEOMgROZHtRGPJ6L7+v2f0nQ9zrpM30EHrMnwvcoal7oPKPiPiri/XCtoZpS1KTpCySrlr2vtm9N9q/p4xPMs+2Ox70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=CeQAQdAL; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="CeQAQdAL"
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6E84F780509;
	Fri, 17 Jan 2025 18:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1737135249;
	bh=bZm/lr/owfl9oGDLKV8iq6pOsMDYdZDVD02QeYjOc6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CeQAQdALhX4/hWTrSENiH1IOL6+2Jm5Z8HXCc4C+P3uHcJqlNZpth0JsGl9+Z+jpM
	 bpW+YZO4yY9kAsBnGi2iXGCyI4qBfxt1gGw1v8r0k8X3gme+fgy96XoxMjdg1OwybE
	 BVd2HKRMn9hmLAgGnGLTiJTZDv3B8crs27mL4pMniyuW6R3+hB581Bc/FyaxDzWCJK
	 N21Q9jgAJEXw6K9B7k+Agn9i+dPL+iDPCFO2YSeTUk++9zancO8ZY8Y0LUAgZXPl+s
	 gx1jnDl2gdEF0yN9psV4X5Glenpg//0Zq7jZlT3SEelKr5WY/nD+v1sKs5HcygZBhD
	 4BupQQywuxXPQ==
Message-ID: <41e01622-17dd-47d3-9ace-e0c45092f74e@free.fr>
Date: Fri, 17 Jan 2025 18:34:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
References: <1c00f906-8500-41d5-be80-f9092b6a49f1@free.fr>
 <173713316775.8353.4944797350274549745.b4-ty@linux.intel.com>
Content-Language: en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <173713316775.8353.4944797350274549745.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/01/2025 5:59 PM, Ilpo Järvinen wrote:
> On Thu, 16 Jan 2025 23:20:23 +0100, Julien ROBIN wrote:
> 
>> The following patch adds support for HP Victus 16-s1000 laptop series,
>> by adding and fixing the following functionalities, which can be
>> accessed through hwmon and platform_profile sysfs:
>>
>>  - Functional measured fan speed reading
>>  - Ability to enable and disable maximum fan speed
>>  - Platform profiles full setting ability for CPU and GPU
>>
>> [...]
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> The list of commits applied:
> [1/1] platform/x86: hp-wmi: Add fan and thermal profile support for Victus 16-s1000
>       commit: dd47fd79b14695d43862f46b19655fcf2a7b4653
> 
> --
>  i.
> 

Really happy to read so! :-)

Of course I keep available in case of any future questions, changes request, or changes testing on my machine.
(And I keep notes about all fixes from v1 to v5 in order to avoid doing again the same mistakes in case of future contributions)

Thanks for all the work,

Best regards,
Julien ROBIN
