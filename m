Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1C37CD4E
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265925; cv=none; b=Esj0KSbnRA8R3nme6nY8pCrE4DGDtPT6gaNOTYJ8ZPbNeAX3fdeBeLgUa2KoxfF3LceyLUvWbS62PxpvIvd7Ob8sMVwM275stCn8DrO6r+rhVLQbXuAwj3ccDODd4V0FFSSbi96t+2R0DMlHU7Jz/Xu0W5Y77ehPifaZ1wdF4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265925; c=relaxed/simple;
	bh=I1LsMJY87bBakuTUwq4rRn0Y7MMOiR7+MeS7IKqV/iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmeJHHq4OxKPZOFeR1mdant/78R1B1qJR2V8vb+1uAL7SfcsXiXvAggL0Cm4T2dZI6g/zADIeOEhy0byKEy2LZ9HX7zY6zJT9y6qrWznz9Vc8dBNt//ightGnxjGW/H0h0XNOhNo/AcRo2EV5+XvFYs6GDLQHAK8nMTGTL3xOjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkY5jDck; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkY5jDck"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490e1904089so7622965e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781265922; x=1781870722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Edyu3UQkRy9bMmyMhsW7UVwHZRSMWmB54d4OHJb/kvI=;
        b=hkY5jDck3y1MnxP2jJCpoEkgMi+Cht6ftfemDz7ivw7HBhBcd+0SCSXZXFAdf8SVG2
         Afqv4KXGmfWU83JziNlYTc195xJX5mBIIF2AWkfXYmEJC8e2CbwAI1vl4p1Em2+8noSe
         QiH0iTV3VduL8zg5LDOw40SVLnLhjLo0VLB39kPX3JBcfOH4ZEwJqbO02C5CkJSTLfgv
         yRpEKGofjwePkH0F4fzByjkm/K9oa5irGYDECT9JKMfqs6y2t2GuGg5qF/qraCk4ZI9N
         9xGff0c5/RE+kGa+LAD6VcXGFidoL+AB21j9faA9rBT//J1fqLZ3eyl2q1jUHP9XUGdq
         jaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781265922; x=1781870722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Edyu3UQkRy9bMmyMhsW7UVwHZRSMWmB54d4OHJb/kvI=;
        b=E11Aui/apFc4v5WHB98waX2B9GJ+MfKeSdQqMlQ2atEyOetSGDu3jIqJ8cu8TLHEbv
         4ufTxrpgga8ZCg1w71b0SdCNwfucnHxi5s30JuppksnXmQavF8fAnSSH2yOzBX4ZjetQ
         okF+41Uqg/4ELw4yVQnmzHWHm6iUHiaWc2Mvy/bRyBtjnmxatZWe7FIlchzfADc5ywar
         gbJONM7NenNib80WIDFnjXGJOXDtquGCvoPsfR9mtIKi20DzvSTgyI1E+J1ViOC42EWW
         Vr72RKBlC4NEq7MiKXiSRnIfifyVhDdr5by0CvJM8WFPPcnAV9hd2N0JDu5hgPpL6XtJ
         brzA==
X-Forwarded-Encrypted: i=1; AFNElJ9Jv0ijmY8Vc7FbKIDYbWFNFbCU5TgetcZLjPlH0fSHzCV5KcasjR4vHYdbBqaK1mVipp3AibmKCWqTvv9ri3JFeLH4@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5Xr/LF4+cQGp4jqDAmVQKoBXKc04j1GGafqp5WNXksp2CX2x
	W+8NVDpNJoj3zS7yP6iwkI2Lg13lVdXz58Z60XhWyoEq8W5wD6jLQh3O
X-Gm-Gg: Acq92OG43T6hPCcGlxkPcNNHdOP5jZXcAilg/sUz6O7HHG6VxUwQtajYKPjlNB9nnIU
	Y87RFK6Vz0oWPywan8zNiSqTC+ZKDeTNzRniEDDepY6uG/OBzFGpw+xhiPWcj6k1w9cvKwdA3se
	r+q3A5awPoY42zG/hDXAM69aQa6WZE3O/QVwtpgo5J+G4TcNxUfTnX4ATiG23WD4mQOPsfkHzBS
	itfJE/mauD1tV1202edv4PeKH5uVuT66djQaMG6O1Mm5kTkcp/BBcrgq5I7AccjqeGTNRJnE8q5
	U6tSxe11GOxuKaJPZtwwLAoDHouhQosxDXBHhnaR9PSMC+PhWL+c5HiCAXINUuvRGZKbf0dnkpr
	Wp14M+Lw2WlgN5aw0D5Z6ptw8Ve/Ci+ywRbFFfABUGb5WuZAeu8c+EfPCem7zY3B+flLY4C9VbI
	DdZf5nwyge3TdYrYXGjHvtOPqEIHXsvCI=
X-Received: by 2002:a05:600c:820c:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-490ec4c5984mr32804375e9.7.1781265921785;
        Fri, 12 Jun 2026 05:05:21 -0700 (PDT)
Received: from [10.80.0.99] ([151.49.228.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7c09bcsm62400265e9.2.2026.06.12.05.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:05:21 -0700 (PDT)
Message-ID: <03039f97-9239-4945-85d1-d081e25149bb@gmail.com>
Date: Fri, 12 Jun 2026 14:05:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: asus-armoury: add support for FX608JPR
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>
References: <20260612115628.964152-1-denis.benato@linux.dev>
 <20260612115628.964152-4-denis.benato@linux.dev>
 <670fcc2d-287e-1e7d-2f31-788fa1d91a6b@linux.intel.com>
Content-Language: en-US
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <670fcc2d-287e-1e7d-2f31-788fa1d91a6b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/12/26 14:02, Ilpo Järvinen wrote:
> On Fri, 12 Jun 2026, Denis Benato wrote:
>
>> Add TDP data for laptop model FX608JPR.
>>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>>  drivers/platform/x86/asus-armoury.h | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>> index 39edc0114b11..9370acc755f4 100644
>> --- a/drivers/platform/x86/asus-armoury.h
>> +++ b/drivers/platform/x86/asus-armoury.h
>> @@ -909,6 +909,34 @@ static const struct dmi_system_id power_limits[] = {
>>  			.requires_fan_curve = true,
>>  		},
>>  	},
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_NAME, "FX608JPR"),
>>  		.matches = {
>>  			DMI_MATCH(DMI_BOARD_NAME, "FX607VU"),
> Shouldn't FX608JPR come after FX607VU?
Yes, absolutely.
> You might have to violate the strict alphanumeric order in some cases 
> where the name is a strict subset of the other as the first matching one 
> is picked from the array. But for other cases, keeping things in order 
> will be easier.
>
Fully agree. Will send v2 shortly.
