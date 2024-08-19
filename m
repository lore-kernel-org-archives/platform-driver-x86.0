Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89FB136663
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724092310; cv=none; b=miIIk4aLi0kL6f4HiPPPZA/kprMpA1vHK3jMwJaScKtUOjt6Fw0OZ7MVK/euJnQhAv79jBNd7MJxVLhl1UajuhgNe33bYWy5FwiCDv5JetHQf2xKkDrN4FxTLgomF+hVyc9IoaVNWL5GDQhbQep73cqRNuZEmIhYjYxAlYnbDEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724092310; c=relaxed/simple;
	bh=jz/ZjxWSKaV9E21NAp8gn+3Khw5Z8VpNkDbDc9dwc2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXpPQ1rQWAjKYX6bpmuKgnjzabqpWpG97qTfPbaesyeMqoMMYZtrZZfCo4RRdT6rIc897FkhvjMVFiE/9b6zLUTaNWF7XJpOCNEqLfNBWv1WODrcX2V8903/d9BvEYSmU6ghaVVGRDHQ5PTDowFZcW/bNNsJwumVi/YxAv70sMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4tPbha5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4tPbha5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-429e29933aaso35309805e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724092307; x=1724697107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxaAE4cpI7LMjHmJRrNjbSHDwPUlpGudLSFm8GQhDF8=;
        b=f4tPbha5pK8VtHWpwMeJFtkj45/3cXr50Yh+mo8gKprpHBrzBGpRg+n+oDL1rat7ju
         yKEpkAS1qJfZSAapFcnwqo01CeF4GpxcksfNMMXmaXnOmPKQxI6Ckl+9XG09oXx58OY7
         4MZUTKf8rNZDjEJvPv+vFlvNr/IuY1CTxtpuqE1k1gtwj98+gObqSubEwAih7Z1R0+Qv
         wKrun248c+IsZ1ShDzMLMoyvj4YHPVsqZHJt8olADLo5sBoJx4ON5OmRarehlyyICFme
         Octbr5HVF5zxQmBBRkT58+GYbMYmWyPKa1zXxamPSonNz23c87TVfZqARH9qKZFBdZsd
         /8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724092307; x=1724697107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxaAE4cpI7LMjHmJRrNjbSHDwPUlpGudLSFm8GQhDF8=;
        b=AAyuoO44POjLQVJW85sQD541nbmh5xpqR3+/QTRkX3TYNFEfXzThu3BzO0yMwiH39P
         nmc44IqMIPt3Cmrdadfy4lTHBzXx5OysNpreZ4FtwMZF/BCkoA1BhPW7+/8bmKZDh3De
         Ip17/A+OSQI2Tf1xrDIVhH3Ab8/jwenZTCULjA9A16eZveZ2TC1h5O+EAsfQoFyb/Qz+
         GqR0jOVhEuo082kW9W5a+0r+HnlixVq4A5+4L39NIqxSVvnJv1TxxfCrpa70yGC5Dw7D
         j5i6MmNmL/JjNun4/gGyiUDLGevxmKQwRov5UmpEz8ns/V5vUsFb3qN2cu0Pvo8S57hS
         y79A==
X-Forwarded-Encrypted: i=1; AJvYcCUsFNi+HbTbmH+atwfnumIgR+1tQ6AbFnh9b5ngmgmusacX1qYeg0Q1BQj3920x4YUu34aFdMuCxYuG7nbBwTx9XIDXR+1OmoSsjH39ygxJmnoVAQ==
X-Gm-Message-State: AOJu0Yz781DgGBUR+VrOzjdLOkjOkwPGI04Y6/G1eRGdhZbSJul7Dpbe
	fWj+D9Ij9GNeZXdXsN7Hq7lRCeEvFrIoQPsOIR3BrpS1Ax78fHC/k48fMZSs1oo=
X-Google-Smtp-Source: AGHT+IGPqrsA51V094dT1HNJcTdp79GxbmHxHjfGNtOcSLpkTDIiIZ0jqfcoK2vPtTRfbGZLpcLtmQ==
X-Received: by 2002:a05:600c:1c24:b0:426:654e:16da with SMTP id 5b1f17b1804b1-429ed61fe76mr91314875e9.0.1724092306583;
        Mon, 19 Aug 2024 11:31:46 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed7847d7sm117705455e9.31.2024.08.19.11.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 11:31:46 -0700 (PDT)
Message-ID: <e438d8c4-3c10-4674-916b-dd645d19f210@linaro.org>
Date: Mon, 19 Aug 2024 20:31:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] clocksource: acpi_pm: Add external callback for
 suspend/resume
To: Hans de Goede <hdegoede@redhat.com>, Marek Maslanka
 <mmaslanka@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <935e8c82-3c91-4c9a-8e43-e6045b28279d@redhat.com>
 <20240812184150.1079924-1-mmaslanka@google.com>
 <e0068ba6-c211-4878-8f16-fe97746c2a56@redhat.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <e0068ba6-c211-4878-8f16-fe97746c2a56@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2024 13:35, Hans de Goede wrote:
> Hi,
> 
> On 8/12/24 8:41 PM, Marek Maslanka wrote:
>> Provides the capability to register an external callback for the ACPI PM
>> timer, which is called during the suspend and resume processes.
>>
>> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> 
> Daniel / Thomas I believe this series is ready for merging now,
> do you want to merge this through the tree for drivers/clocksource ?
> 
> Or shall I merge this through the platform-drivers-x86 tree ?
> 
> In case of the latter may I please have your Acked-by for patch 1/2 for ths ?


I'll pick them, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
