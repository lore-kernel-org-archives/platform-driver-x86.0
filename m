Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CA3F2106
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939796; cv=none; b=K+rGWgo5J2/M9iOqaGpDeXBxXf/cyzTgJvl/gdj94tCJ9NrfxgQhy62Xq9t86Vq0Z3iFhfupab/E172AeE7GdIjNYxLafvygBVZzW3vMFRXpx8eCdcdXhLTDYwLkcWbCoyyqAeqGAvIRnZqzZ2HijqIOFOi9fnrGoKG0Ybn/8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939796; c=relaxed/simple;
	bh=4aO8tqhKF2jkSuCny1eOF9M5ytqdAvJRGahmxX91lz8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YNP8wHucV8U+Ka8hdUshK8LLYwfeAlQMJEzStU7abn531O4lfnrsV4icBpTDYjrk8E+dhBYBVD8Qz4jxTGaL3jwKetDBh3eC0vnxeu+xoLBO8mGBNUjCFFFj/7T2b+IMDnEm9ryglo3itIgoanYzh+QsFXUtAlVLoxnv7a6W66M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLiF6E0j; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLiF6E0j"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1001668eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773939794; x=1774544594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8QRs1JUnj1CzqP879x0gx21vAr6VwbWLeh3iHTqqzhg=;
        b=QLiF6E0jUEZAFHYK9WFm5mna74oZ8vYd0WbFZM36BRoFWpszwMst94Lrd4VSDLEGdm
         6VRrc+wKGz5pqvRdMKUjaw0hZzCEJT261W56EgRtVkGod9UzbwCN0h0avwYKfx8KqYLe
         JI5HBVdWqJ+uUSKPguu6LJIoBrX744TJic1Itq0GCs590I6OeqerNM/bFimlMyY10tgx
         Ac/uJRdFm4TYSMGU5OZexSOuU5yWOi1CpV8Oh7ftbN9QVJXF47WJy+n90Dza/4Xi0aQN
         KbA2PE2rQP39AVZWatVgJ/9cTT5HaAE8G8Vaf/kopHGjx7Bnu79bzF37SDsSEnUHyc6T
         tpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773939794; x=1774544594;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8QRs1JUnj1CzqP879x0gx21vAr6VwbWLeh3iHTqqzhg=;
        b=mF5A58+ZObQib/rbI3mWf/7d6U+srmq/HZYjf+Ud63hk8Q5lCbkRBREatvQpU9dpsg
         eNErALAfEraoyEUgbMSP/chxq648GlhBdU919bCDmy1Nlo8tSL4wiKJoKMJSj6b/sOOz
         xi/oXI+6wqo+PH0s+5JBZ+UnMFGjF8D+wLSCVeE+7oDWT+wYlTCUjMrnIrHmR0Wh0sE1
         DnB5qPOgKRrS//C+tALkOYc5sLbPtstw2pkzwFtKLTiyZFoNQrGkCglbybnZNtipOKhy
         jb/llx8N8A4IS6HnKrmexHNz1qRUT5i5XkmjzaDLeSXPuwAM5sWVBbZBQ4DUypghAvC2
         1cdA==
X-Gm-Message-State: AOJu0YwE+06dg/IikDdfuobFhl8BG5y2mmwYRkRLYhy6ZqeB94zMjKde
	m1Qe1hlC461sPr4dNCFx4H4HldbR+HN5+Yiip+oPXkqRB9LryvpJTF7D
X-Gm-Gg: ATEYQzxFBqVXhkFzxUcxCleDkgGKGHB9jyCwB1ywm9470R23ZQJeQjDvlX5tIxtnhCC
	Bs8tEcpFLuUIbR80lCCJsgUZm+njXzD/Dy5ETdmvZMZa6TnXyjJ8mRx6zj8OG/do4fVkarMGpjq
	sGdJ6mo/e0F17Y0NXKJuHZeys0eKHUUtqn+MWYFaf6+Lrt0GVwuWPkkJ0pcp3TY0HzT8vw8wnd4
	Le32qWvoRi2CRIlT148/vleZEb7JY6e0B6AaDeElXTe9x4uscyWBqmhpNlgZwS9YDp3t1Mszb4c
	/eOtdBl3eeGl20Z/t5Gpa+z+FyOtNrP/8BjZQf347fUnIiXtnDPo2+Y0DWJxsQdfFR8o638tDxW
	kMMJaD9KLZA+StrmcQG0H1WuBLyp9lG11hY1J0B2W6VqHK/SubedcmnYam4YqTp06Z8XAavSOI7
	/lGk45Zl3Mb/YlQvo3gf0ccxdQhT+JwEF0TsIZCdV/TSOoGnMiC1Oe5fULTJfUSJwTGSIexnKc
X-Received: by 2002:a05:7301:1292:b0:2be:9e34:fd24 with SMTP id 5a478bee46e88-2c10980bca7mr42291eec.34.1773939792465;
        Thu, 19 Mar 2026 10:03:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm8998619eec.30.2026.03.19.10.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:03:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c9c003cd-4452-4ed3-9abe-3458d432a4cb@roeck-us.net>
Date: Thu, 19 Mar 2026 10:03:09 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan
 driver
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>, linux-hwmon@vger.kernel.org,
 groeck@gmail.com
Cc: platform-driver-x86@vger.kernel.org, jdelvare@suse.com
References: <20260319132920.275755-1-sergiomelas@gmail.com>
 <20260319132920.275755-2-sergiomelas@gmail.com>
 <221ba4ba-73ac-44b7-8663-60889ebe8e9e@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <221ba4ba-73ac-44b7-8663-60889ebe8e9e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/19/26 08:59, Guenter Roeck wrote:
> Hi,
> 
> On 3/19/26 06:29, Sergio Melas wrote:
>> - Support universal ACPI fan monitoring for up to 8 fans.
>> - Support various ACPI path naming conventions (FANS, FA2S, FANX).
>> - Implement a passive RLLag (Rate Limited Lag) filter for jumpy EC data.
>> - Use dt-based scaling for physical consistency across read intervals.
>> - Filter parameters verified via tachometer and FOPTD identification.
>> - Use 10-bit fixed-point integer math to avoid floating-point registers.
>> - Support KDE 6 Plasma Sensor compatibility and stable S3 sleep cycles.
>>
> 
> Thanks for your patch. Unfortunately, that is just as wrong as before.
> Most of what should be here is in your patch 0/1 which 1) does not have
> a subject and 2) is unnecessary for single patches.
> 
>> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
>> ---
>>   Documentation/hwmon/yoga_fan.rst    |  36 +++++
> 
> Add to index.rst
> 
>>   auto_compile_rust_lenovo_drivers.sh | 196 -----------------------
> 
> ???? This doesn't look like the patch originates from an upstream
> repository/branch.
> 
> I didn't look into the actual code. AI code review will be available at
> 
> https://sashiko.dev/#/patchset/20260319132920.275755-2-sergiomelas%40gmail.com
> 
> once completed.

The AI says "Failed to apply", which isn't surprising. Please submit a patch
which can be applied to the upstream kernel.

Thanks,
Guenter

