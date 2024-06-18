Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40B215278B
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711772; cv=none; b=FNCC9rnfZfVAVajwe4EZO6hOoQq2097NaG4y1XJeENEDpkn6LlnyFUoGO9s6zoC0cSGd59fbxDUpGh49R8bLGQn8p7lIA9C/hB03ECg4qsObD+zgw8LOGbDEradEYiNvCqm/XBdsfSjCvXk+GO0bro0bMtU8rtceqaMgiZv4F5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711772; c=relaxed/simple;
	bh=jpPEB/6YZTPYLy3RYj7LOJsKZCfOADwF3vloVsYeags=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbGgy/2Nq8BlIQZf6mhxOyN5c/ZSJszWY0Qi8Bi3PPQI/ZVCv7tlyXXhpS5/KNk9JKfraLt4PZ/BWjgNKlFYJdTL1hBkjjMRb4GgU1dgzA5/NQ4v098Qo0jjxy9wzEWm4KGwwrGREVbQxIPXy7+qS0v4bq60nE5kUAp+mmGqvi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KW1i0k9q; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KW1i0k9q"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5295eb47b48so6338340e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718711768; x=1719316568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mq75lZPvciVQwZ7mi6K5o2q0ASdayZBfX3qCcW8QAuE=;
        b=KW1i0k9qj0DskKaCd1uV1Dlm3Ignkxrap9uKQr1wHBUc6iiPcmYL4bQAjj1qoJJmk0
         c6F4rsmFO2rpCbPJimWUuw3b/2paE4eA1VjbNXnPDQtPl4UwRx8hltyorbVoKUQsJR0F
         F5N3l6JCZdON/lrLnQnFxr0O+AuQGi8nW6B9hLXQ6JGfv+hcEBf2OZMcsrJEc17WwShE
         VhQOy856Ii6Jj0/DukJJ1KLdp3cD2uqKrRQKt6tJwm9VfyxAihYjcScdd3RsBApNUT1Y
         kEjNdXJ7LfXm4prHCAVvJRbmRTzOuEaRYWPLFINadyXml5OMfkCXffUwg0hqUf08wYw+
         5Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718711768; x=1719316568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mq75lZPvciVQwZ7mi6K5o2q0ASdayZBfX3qCcW8QAuE=;
        b=Y+Gq4sOGIUVLkyZKZgW6gNLLSgHCj77zAx4csiPlFvTIYO9xxncZczen6cJX9qGlmZ
         rjic5KtPlzxws361goBUvMJm8uRR8dYgTk2shwh2FKIUfQi5aSf6xBDool4RRK/SvJT6
         j90o8JUdZjjdJI0mjRi2ot91374kynqTZcqJUCOs3RH4uWveYkHiwHOhuyUqCNFy9JVU
         WyN8xH7Eb7NRhGHo+Jz9WnTXUdVEwl4CQ87tfj7eVNofphD5csHslL2ZEgeJCegqU0rr
         d9NqmTf/BLwwschrdppb2huIYIuDuD8nqN8kBvwai/nqg4PWaxjYzeji8M7UDtagXmus
         XgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWULJdFnsSsub8YfQrzkRcslHhdEGejMgx1iP7OXhbifAOk390AVR29BBaCr6sk1IjcpXhC57zpVbl1cZKT8Q0WvfqvpxYn2doJUKm6f69hURPk5g==
X-Gm-Message-State: AOJu0YwWHs7ckHRXXw8zB7MiuoadwwBuwx0HhTXVca+C8z5xdUZBmD49
	t1/k4GbcCw6XUtj3QQd/nP7AaUugiZIGIodyHmvpVJxPlUtqQlBJY79WOJTp0o4=
X-Google-Smtp-Source: AGHT+IEYh8t5Lf/IT2gzYEj9aUFut5HJwk0C+UH8HgqmpV5pG3oPCZTtmSV1TDxS2pKMtIogxvp+lQ==
X-Received: by 2002:a05:6512:3b93:b0:52c:8206:b986 with SMTP id 2adb3069b0e04-52cb621b577mr6055207e87.56.1718711767941;
        Tue, 18 Jun 2024 04:56:07 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28870f5sm1487968e87.249.2024.06.18.04.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:56:07 -0700 (PDT)
Message-ID: <c807a7c6-ac17-454d-9a99-1a221038774e@linaro.org>
Date: Tue, 18 Jun 2024 13:56:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: c630: Add Embedded Controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Nikita Travkin <nikita@trvn.ru>
References: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
 <20240614-yoga-ec-driver-v7-6-9f0b9b40ae76@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240614-yoga-ec-driver-v7-6-9f0b9b40ae76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/14/24 01:43, Dmitry Baryshkov wrote:
> From: Bjorn Andersson <andersson@kernel.org>
> 
> The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
> and provides battery and adapter status, as well as altmode
> notifications for the second USB Type-C port.
> 
> Add a definition for the EC.
> 
> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
