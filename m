Received: from outbound.st.icloud.com (p-east2-cluster3-host10-snip4-4.eps.apple.com [57.103.77.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952F3043DE
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779056220; cv=none; b=XC0IEJuoawKUVxz8xvs4V2Iq4y/DGD3uia5cpMShS6/U22+BALbO3kLHUIKKPIorRySsrdMSRF+ZK3M6+mlatRloc3O1DiFHtoCBGbr0vqXm+nbtpt6rIXiv3x/vcmhbEjEwNJH6R88y6sWLXQndVU3szqd1jW05tJcN3JhGKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779056220; c=relaxed/simple;
	bh=/jvnP5BEgPIVvnD0g6bgpGqeZMd7YIi6EJcNGgJAKmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuDwAXIsf7ftPuMM92uJBdFwRWBjJ2o1vogb35UfqfmyB4WVw6M7YzBdDDjh+xrHOIalwcCZz2FLl0GZAOentbEZkFXSEHHf/ciyVlHtZZGaf+OpjN3/5RZU6l06TfUK39yhM4YFflnYWlksGpbfLyx/qc9GoVHULRquQfflK4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=YX3m+FXZ; arc=none smtp.client-ip=57.103.77.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="YX3m+FXZ"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPS id B8C431801BDB;
	Sun, 17 May 2026 22:16:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEG1sIUhhXE1gTVl8OXQIwUBtfAkIPHBNWFRMLU1ZRGFwdQAhUClkVC0EFXXcCURxWDVdDVARfUEsbDlsXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BeCF4fTBwdDlgGEh1QHA5RDlsCFgBKAlUaUgcWW1UHCQJcHxELGgBAAA8BFQ4aV1sGD1cVeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779056217; x=1781648217; bh=ulCzw2NgUu2BUgWlvH3hNeQX1YXWt94X8MJSULohJC4=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=YX3m+FXZ817fqgAuD7Z5IIcE2zYf2plqg5/r+5yBgfbZCAB7Akm6xOuuhkPqVbaNqH/KKDGrA0GmKGLbAH9zg0m8q0GPwAzx+9Iz8Xs1sMbEerYJbZGifZeUEN37ht280TS7mKiIrOwmLK3OWkOgmermQdZqGBGBwwIl4AdOqJbRV3q5jwe9twiBAganJXeX0K7dMMKBdxafhcOqmCR+WFEv9ijmCYQJaeagA2bLsDEjKqAsVj8E/BdPeYI+5NWHRb2SW/lQaITmzDG4lAay4JrYKpisNZAecEsZmsCj9rolMeiLgr0PfYJcfqCf1mEOLdEWxIGK4VmOayJcSmN1mQ==
Received: from [192.168.1.34] (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPSA id 61C131800C0F;
	Sun, 17 May 2026 22:16:52 +0000 (UTC)
Message-ID: <900f9218-95fb-4d57-a2b3-7d3e7bd61dee@icloud.com>
Date: Mon, 18 May 2026 07:16:48 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typo in uniwill-laptop.rst
To: Armin Wolf <W_Armin@gmx.de>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516070650.9454-1-cheesecake2960@icloud.com>
 <d693ffc6-08f0-44ad-a274-c25efc3fcfb2@gmx.de>
Content-Language: en-US
From: Cheesecake <cheesecake2960@icloud.com>
In-Reply-To: <d693ffc6-08f0-44ad-a274-c25efc3fcfb2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDI0MiBTYWx0ZWRfX/rh9Fn3abkri
 YsPejqtXoj3JoEAHFEwbxgcHu5wlKzMG2snGf2hmV7MBOmFYATZ4j4DZTuE9k3e9Nhaf5f7nf3U
 nivQm7bYsL8MVj9QkzltfSRmwxiQyC4D0oieEMAFOCTcuIaE632Of8mgORVq2g1+aGXfZsKjYM1
 /pmmjClmO0EKVymDj7SqjpPGB1YGuzOKwqeMvJ0h1VFxOzkQzpElvR1nIX9t/rGfmUmDKEvc3OC
 cytuI5KJpM4WoIITeBNWL9PgXm2WxkwxrWuU6M58hj2USW5fUb6jIb9X7jYRIqUaIgogl71ZJQk
 bVUHJqM40bNUv2gU1RhsGPUDGIIx/VQqshJT50p0CRQfBOHkYqmVpaQO6xZyQU=
X-Authority-Info-Out: v=2.4 cv=IfmKmGqa c=1 sm=1 tr=0 ts=6a0a3e57
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=sIGCgqHK338A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8 a=Ass7DQ-I9p7-9zMoZ8AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: 19vxy5Lj4Lk_VDVTE7hB0S82MlYSIk2c
X-Proofpoint-GUID: 19vxy5Lj4Lk_VDVTE7hB0S82MlYSIk2c

On 2026/05/18 1:01, Armin Wolf wrote:

> Am 16.05.26 um 09:06 schrieb Cheesecake:
>
>> Replace "benifit" with "benefit".
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
>> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
>> ---
>>   Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst 
>> b/Documentation/wmi/devices/uniwill-laptop.rst
>> index e246bf293..65583b239 100644
>> --- a/Documentation/wmi/devices/uniwill-laptop.rst
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -189,7 +189,7 @@ Indexed IO
>>     Indexed IO with IO ports with a granularity of a single byte can 
>> be performed using the ``RIOP``
>>   (read) and ``WIOP`` (write) ACPI control methods. Those ACPI 
>> methods are unused because they
>> -provide no benifit when compared to the native IO port access 
>> functions provided by the kernel.
>> +provide no benefit when compared to the native IO port access 
>> functions provided by the kernel.
>>     Special thanks go to github user `pobrn` which developed the
>>   `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on 
>> which this driver is partly based.

Hello,

I accidentally used my nickname.

I'll resend this patch with a proper signoff.


Thank you for your time.

