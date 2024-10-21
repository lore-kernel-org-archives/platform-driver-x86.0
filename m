Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183601D1F4B
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729527725; cv=none; b=h6AY8ByYrByQp48fdcsEwOVp8UwXwbrrRg9g7wxsH/TvWcBstslYn9lYWu07UE1LxPEqfKrnGu5aBSV8oYA3Mvq0TXd5QIuYou8kXVFTtjEz4SflxdE31wz40NdPnGEcL+g7lo1yvwqgcI9mbI2e2ehbH8Rm+xfdT9y5EO0POXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729527725; c=relaxed/simple;
	bh=aqur2+B/ScBUkOQjBZllh73UlhuGddhcZy3ReuKLBws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+M/4Xdpd6FwKcEClns/Pc9h4AGX6krqaZDFakSkgJru23GXv3yCFZTjdFj2Rj7olRccfG8DvA6Lh3jRv3vejTX4LthPScRDzWTwRRS5ScRpE8L/oCjg4dRWmc/SVq6rpqRx4tObQFCfxGTMZ/8J40B6DFvOw4arkdquAKFAC+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4oVmXVu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4oVmXVu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so46076595e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729527721; x=1730132521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkYtr7pn2JG2itofY99ImXF2puZ7hGJei8s9vBda418=;
        b=b4oVmXVukwZzwy3txSX1xdTb6Ppyt7RQ4flT1LMXYaCilN8vWZ6j7v/qfrKyMXGK39
         DKY3ifJahd1KBbmpY66HPzPmDSgNMYas/2Xq6/j0H5PhGzoroQ7qV+ipZyH3BfErTnN4
         uqYkOL5plg6Lik3oBVbpCk6xniRODUKucEIZoQPkD7wCy+7JQa+ugWkm4NAVC8dXBjCY
         I5qvjJDWqduXqORbFf3gywMVthriLouIpLl0aGpbVdwbNeD4XV+Tsl6+q7f8hR9d8xxK
         P2yUr/QW2fiasS9lcNQcJuKFuEbsdbhehFQ5/jkDZrtPfc9SeYtxAj8HgF8ILd620AkC
         bosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729527721; x=1730132521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkYtr7pn2JG2itofY99ImXF2puZ7hGJei8s9vBda418=;
        b=e6SDz9JhL28sJMuODr885Tqnnd6B5RxiLjOniSOmQVSbq2QVzd/BurdjsiHfVcDY/L
         omaPwuq+3wV645klrh4L8I0tQ4zcIaxtt6OudRMs2gF+JrxPBagiWwBinzim1CIdZRpL
         k8kzTlM+/amDMFqQMDC5XnehQQweaLdF16yJPyaY4nVBQzEjQOifhKUvnIhXPbpTzPZe
         243EYEAQrqZZZTAdqYTSf6ahEtj0n0JX5YG6UIYjN28G/7fxPVhhcYB2ZqmXC+DHxRk0
         Ccqva+dO9WuVzO8kG3nv6UCQofodF5SLu5FljVfN2aPwqp/7HmGGqckZdUDI+01Ct1PM
         otFA==
X-Forwarded-Encrypted: i=1; AJvYcCUueULCpWWYS3Li7rVYMGVkc9lcyMH9Y6/Td2pIWpQZ3LxRWm1GNwEHybc8wyyb27qIXpWmenwFGXHXdZmCe62aLTok@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJ4H0uMDdB3S0uet6s6uGDn5qgeEG7gsIu3pahwc3YaWcjhqz
	SOhaFHOfPLNRu1gjGpjYVZcP9Pz7NfHPJ/UwWK3zzb1UsO1k829y
X-Google-Smtp-Source: AGHT+IG/G4pnevziazcEE6yb0lEv7rA3+D30JnmHzQovUaRt1On42hhF8Vy1euEwCBGzVoLz0DLWwA==
X-Received: by 2002:a05:600c:474e:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-4316162875bmr97112055e9.10.1729527721163;
        Mon, 21 Oct 2024 09:22:01 -0700 (PDT)
Received: from [85.64.140.6] (85.64.140.6.dynamic.barak-online.net. [85.64.140.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58f2c3sm62284305e9.27.2024.10.21.09.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 09:22:00 -0700 (PDT)
Message-ID: <0ba9356c-63fb-2ec6-59a8-fd7bccff7bb8@outbound.gmail.com>
Date: Mon, 21 Oct 2024 19:21:30 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] char: Switch back to struct platform_driver::remove()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mattia Dongili <malattia@linux.it>, Michal Simek <michal.simek@amd.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241021104511.405661-2-u.kleine-koenig@baylibre.com>
From: Eli Billauer <eli.billauer@gmail.com>
In-Reply-To: <20241021104511.405661-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Who am I to object? :)

Thanks,
    Eli

Acked-by: Eli Billauer <eli.billauer@gmail.com>
