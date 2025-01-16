Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A85114A60D;
	Thu, 16 Jan 2025 02:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994814; cv=none; b=tarlWyL0+RIDKgrdX+U6zLakFKJ6T612GU2zJ32QUV9DLKZEtrnSxBIXI+/8e51o7XjDVVfZMDzqeQSkkrLkNVMSCalfGnxA8CNoeqJqNF8EtxpeDsJN1vxYIgTLonnhGDOh6g1PPAJ1BYyk860ZHManfrP9nfLgN/PMg/MY/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994814; c=relaxed/simple;
	bh=SJfxdPDVCgHrq+ojupH7cml8iU2ebXxVnK9LCVQdByc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqdIIK8UxmaaCVBFlm3vjvkr1hyL1INkUay3kKL54dRMNScOMoZGdrF+Iiua5zw1Fo6E1gdjjfx2y8tO8MUQXUgfOqoghD5C2AQJgeSTZGqVRGOrHXPK//Yhkh3CLXnQxX2JfgpAvpxfPQBYD3s4kS5rdqD9fxT0RrdXsroUmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [IPV6:240e:404:1a00:ccdf:b179:7dfc:ae07:b1e1] (unknown[240E:404:1A00:CCDF:B179:7DFC:AE07:B1E1])
	by rmsmtp-lg-appmail-31-12045 (RichMail) with SMTP id 2f0d67886f05efc-47319;
	Thu, 16 Jan 2025 10:29:37 +0800 (CST)
X-RM-TRANSID:2f0d67886f05efc-47319
Message-ID: <4de1eb4c-854d-42a3-ba89-9299196dc7ba@139.com>
Date: Thu, 16 Jan 2025 10:29:28 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ALSA: hda: Support for Ideapad hotkey mute LEDs
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, bo.liu@senarytech.com,
 kovalev@altlinux.org, me@oldherl.one, jaroslaw.janik@gmail.com,
 songxiebing@kylinos.cn, cs@tuxedo.de, kailang@realtek.com,
 sbinding@opensource.cirrus.com, simont@opensource.cirrus.com,
 josh@joshuagrisham.com, rf@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, dongeg1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250115162515.15026-1-xy-jackie@139.com>
 <87y0zchv3c.wl-tiwai@suse.de>
Content-Language: en-US
From: Jackie Dong <xy-jackie@139.com>
In-Reply-To: <87y0zchv3c.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 00:59, Takashi Iwai wrote:
> On Wed, 15 Jan 2025 17:25:15 +0100,
> Jackie Dong wrote:
>>
>> New ideapad helper file with support for handling FN key mute LEDs.
>> Update conexant and realtec codec to add LED support.
>>
>> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Jackie Dong  <xy-jackie@139.com>
> 
> Applied now.  Thanks.
> 
> 
> Takashi
It's great!
Thanks Takashi for your professional suggestion, special for detail 
comments and sample code. They're really helpful for me to understand 
and study Linux kernel.

Best Regards,
Jackie Dong

