Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB846DFE4
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650495; cv=none; b=DXuzThEkB0B6huAhgOKmhs714U+UlXz6YB9LeoesbGFnWl5U2c4SRiVqkNdWqpxIvVFq8I8IOR8yh34BnO2IdgJZ2fO9SXNu+Vf47uB4Q2YPN2Zg5TIpB0wTKwcW4mqrXsti0LWQi1e17aFrf1mu7kvUZNhIpS26hVe6RCO05p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650495; c=relaxed/simple;
	bh=0a8Jfrhj79DpOOf45KS6ypb9nmZ4p0kwiTYVIEOwp9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0NmzqL0ikAdCZE/qrXN3SKy59GYJaUwgHzIhH3U3bUftDymwXY/xEgnvE7X+Dfrp0I+sVoUFvulz2RYtuH9wIBz1tXZA6NGnuRuZKx00x5sIxoKHT4g1jVFyswkkw13JJPhT5AWN1RFGWP6x0lJg2rO2H/CZUpW/DxoS957va8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cec12jBR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cec12jBR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49552f516beso1294925e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650492; x=1785255292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NIUWYbJohmYF0ilxotgfXsgI2XyduD4k/l5pe9IFZ8=;
        b=cec12jBRo/0U/HwAi6HmvXDOYXNWGm9MaKkRvLnmlQuGo2ju3GhlIbKy7ThxDVxSjd
         4oiwfJ/2czFxdMhjjAOyZL64wRVus5SCZEt5ZCtEzbBCEM2iK0kjCa8GAjug3LBboudo
         rwz3AXN5h7sGWbDYxmI9GcO3eBtjofgl/wCKnTRQwvesCXcO5+xKJ9QKkICpbd5TgEyi
         KxeBjTqKfouuuAWz4enLS22nvBLnW8KTdZDnxyNDJ4381NPF39V20voFlnFoJa34I+lC
         EuiFwAMM+syq9tMl15W7mNgqYNEU9NhQiMKaMm4c+Qkg3UFLKMtKk/IFexjBwL5eF0FT
         V8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650492; x=1785255292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NIUWYbJohmYF0ilxotgfXsgI2XyduD4k/l5pe9IFZ8=;
        b=FDzLG5dXHaSby1cf65W1IgJ8CsRqXDcxZKccYOisiDYXDZAw0b+qUDxHQBFM2h2FUX
         0jhHfPv26JGgZPJ7cYuk7RLAjHJCB9LuTQkUtx7FH8u1hO0Va3JCJaJEYAQs0OEG3FkW
         2rvt9SfqUy+IEM3qsHAdwbRejD104gVSBrCU/cN7R1W7DvWoy66NjW4aF+DjsG+/6g8r
         fo25LJ0FDBBvYCS4mSzj4u17cOePkmQWf/hBGzQFrT7l4Y26io0Noi6vZkj2z09WovGq
         d5Xg6NcH/eTeBlGOIiZzh5gANjHnfY04aeD9VlbDb749Vz0G/F6MXVRjrM4XTYCZooon
         KdPA==
X-Gm-Message-State: AOJu0Yy1xvXuF48FlcVX/aZLmOMmz1UJmvdi4TFrukgX8OWw8EDQHNZd
	LMxL9+5KdezePccTmzAgmaD1xblevN9vT9KWTMPHYGdlt937OPsbGTbe8cjBKsIi
X-Gm-Gg: AfdE7cn7hq8jVolDoyt38LC9H9C+kuZFBNmCB9xH7k7G1wwtyFkg1F1Mwid0B2dHbzl
	vwp1bv60MqgpdK03o/uKNTHMHNWzQhoFNr4TAlhGHMsJDzFtoB2zoX4UZAeN2R9qDJOGZTzoS0d
	fbBUc3ATPe1nfa3Z7s8ePpK65WdfE+z9RPIVDoj6KBv1mjNSR0aP/MbLf9rtROHGAkZae8kP2IU
	p1Ga1GwnWQEix8LayjuCWNojDBUYNo+AiyhwpOgR1WUhEIoZZg2N6I8HKKfCaYg8qwt420FsALU
	L1PFYcItFkNQZnugbaMgNyT3vENTYyyLxC6wLzLgvKpjmkfRiJN9BColvWGXrPXBSDGBENNZnh2
	inMirmdmw6xr7mlTWmOJG1qRHGvFzA+oFbAJ4leyfL24b4YD892c9lKWHeStqCKbGLInNABlzex
	eckvs=
X-Received: by 2002:a05:600c:5287:b0:495:6932:b233 with SMTP id 5b1f17b1804b1-4956932b26cmr11500545e9.4.1784650491593;
        Tue, 21 Jul 2026 09:14:51 -0700 (PDT)
Received: from [10.170.9.202] ([179.43.189.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565373200sm76016035e9.5.2026.07.21.09.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:14:51 -0700 (PDT)
Message-ID: <5b4963cf-7603-4844-a46d-67613e922425@gmail.com>
Date: Tue, 21 Jul 2026 19:14:48 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86: hp-wmi: Fix WMI error handling
To: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, krishna.chomal108@gmail.com,
 radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev,
 mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com,
 jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
References: <cover.1784195117.git.emreleno@gmail.com>
Content-Language: en-US
From: Emre Cecanpunar <emreleno@gmail.com>
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the review.

These issues were found through code inspection, and I do not currently 
have hardware reports reproducing the firmware error paths.

I will drop this series for now and wait for the hp-wmi migration to the 
newer WMI API, since that work may address some of these issues more 
appropriately.

Regards,
Emre
