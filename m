Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5101804A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271026; cv=none; b=n6J2UJpZvyoBOk4TANZMTpSvGqYgY38E7fn1rAteSPZhPgbxWqJpOXOylJ81vDLlBLHDSwza6cGBP9O4B5vHjyhVjZTC4FCigbvst88hKJFbeBE+y7GJNPfunDGVdZ7DPXDsuC+6aopJ6Om3GL2auzpiBxvU0aFFIoMChd1XEO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271026; c=relaxed/simple;
	bh=/GqAbhkQstC7mbytnJeMYnYrCrcffDdTm3yhlnlEB+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGkWj7l5q0by9HCnQpCR6HBRRu236SAJJWBSRJVDJ7c4ibSu2bT1wsO7oOVZRVaaT6bx4HXlXtWIwdDhjrgqC0IPeM3KCjrprkOZBbbTzMz7BZlcRFHQ/c0dcXWhie9xhyQ3jd1i/nrT1QzDNUgx2iolz8Hnu0EB5XSh3nC9FnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDBCaeTi; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDBCaeTi"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5aa400b917dso2820925eaf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713271024; x=1713875824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91MYcAga8BD7KsVsct3YkuMfib3UJbPSn7AeIazsUko=;
        b=LDBCaeTiEzsEW1baR72JTpMOSGmONnGwnhv64CRJaICfQDHKzYzysA2R/Q9mQYNSEH
         NrBOA58UfOTHYB2ml0Ltxg0gObboFtl4yZUhIZuqiMvfOORGOySRLOHdL6ALH85eo4OB
         AUayGWpYIeDjwctcLa9IJaDDVoyhwYcvLBIxw1k1oW75jTKzsVFS+Rj5MvJp4/0yzTen
         6cXbVkOAqtsvUMBWv7/Hswnxu552YQE6Of9CJxwSNVyKjFuYnwsAywg3EwNCFz9tATH3
         ISnkNemg+lcpDKlANAciDCZtJ4xF9yaEvjxJ+rmZqLlL0Cal20UO/lxR7rluq/BGlfqI
         YH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271024; x=1713875824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91MYcAga8BD7KsVsct3YkuMfib3UJbPSn7AeIazsUko=;
        b=b7ihL0g1r1yoOYWk25zNcWw9ViN73lhivwQSd5KvWqhmontOR4gFKE8CsiKXmlgjja
         7S9o2PzLxJtXfIf0PaoCkLk+yBEiBfuZhX97+TB5dvD6W0uxrXRXgPR0J3RVdCjHmB8y
         Ii7oUyuoTOXQZryjFjAAbjslltpWaHV0Mb2rL8QG4HH2oAL0T24S23cDl4+XZ6UpQjAS
         T81zHIZCZ69hPLf8FLIJ+yyE7V42Xm180v7u6/b1WCpkdo9X4c+yCGfvch4/uks8zbYq
         CXhLiXfDKc1OnT4G96VLmsg7Ko+9I/vOKxDXGX+bJemwwxhI9/EY44IL1OGVRFpq5Sr7
         3+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX57E9I77QCFF9c/WA3HDAdCRUxjxbKFvdZyfRsoUQVRT3kKoPUscL60T1ITCCEvT3rxxBqeOVGSROt5aXg6+t2sa+zOChcQUvxdLz1bZFWS4dpPw==
X-Gm-Message-State: AOJu0Yy0YNaQ5mvtGeLXv+T265uEpz/BYLeSG82std8v2IxuI0Ve3dBw
	KDwiz5vTQaWD3jTr4afl0Fcy7bzK0sYgQl6vA8wxq8IN+4yIDs18
X-Google-Smtp-Source: AGHT+IFQ2SDTgRDHM99PQ8USms4pgcVD54LfZs7+MVCLLHwRrI1WICWO+80vU9wbe2tnYgAXcYlgxg==
X-Received: by 2002:a05:6820:308d:b0:5a4:aea7:8066 with SMTP id eu13-20020a056820308d00b005a4aea78066mr15967852oob.5.1713271024557;
        Tue, 16 Apr 2024 05:37:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f702:9c77:c230:a0ba:a1a1? ([2600:1700:70:f702:9c77:c230:a0ba:a1a1])
        by smtp.gmail.com with ESMTPSA id u37-20020a4a8c28000000b005acb0e90e39sm889518ooj.28.2024.04.16.05.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 05:37:04 -0700 (PDT)
Message-ID: <f2ae6813-0e88-4d64-8dd5-465c02061cb6@gmail.com>
Date: Tue, 16 Apr 2024 07:37:03 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more
 BIOSes
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20240410141046.433-1-mario.limonciello@amd.com>
 <ace9e5fe-0565-b24d-5394-ba4bd9f4305c@linux.intel.com>
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <ace9e5fe-0565-b24d-5394-ba4bd9f4305c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/16/24 07:24, Ilpo Järvinen wrote:
> On Wed, 10 Apr 2024, Mario Limonciello wrote:
> 
>> BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
>> being worked on there is still a possiblitiy that it won't need to
>> apply to future BIOS releases.
> 
> Hi Mario,
> 
> Could you explain/confirm what the second sentence is supposed to mean?
> Mainly I mean "it won't need to apply to future", did you perhaps mean it
> might need to be applied still to some future versions too besides this
> one because the fix is still being worked on, or what?
> 
> There's also "possiblitiy" typo, in case you end up rewriting the message
> and send v2.
> 

You probably missed my follow up message in the thread, I tried to 
explain in more detail (and also caught the same typo; sorry!)

https://lore.kernel.org/platform-driver-x86/ace9e5fe-0565-b24d-5394-ba4bd9f4305c@linux.intel.com/T/#mcf25cbfbd9dc5f4aace5b58c56a7f91671b2f0cc
