Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B12D7DFE
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786934140; cv=pass; b=Np/yTTxm6nZoGzlCIw7A4osma8o92xHqksjSDFMqWOaGGzuSTcp0G+YsSf6qLow70ADmS3Oqy2Lgkk7fCYshCYE5NBFgfXz34wbjyN3nf00LLZ6iiZsIhb9sp55PFYhg34wX/lnYTLy8ptJ0iwyy/fabvqEFrcKgm13KY9s8xb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786934140; c=relaxed/simple;
	bh=jy4ITIKArET/N50bQPN9FTLH59G9qDybtNKi0fRwPa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlljogAFjNSkJ+HnmjUSlUr7hgrQP/215JGUrmwHfs0AznU1evbreHp4QY42uSAG0sDO5nTjhQN/MofdgrcqRa2UuQFz/fgrRaHOZL1Sqf+im2ZJSLal984ZjZjDwv65ALqCLTxCSpLg+XwxJ09kLsHLDl1cecZOGG8YsGEd50w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdBHhIwQ; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdBHhIwQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so4096517a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 19:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786934137; cv=none;
        d=google.com; s=arc-20260327;
        b=l0ts056A+FVeMpsp7+YnFFjvakv4Q8FWfENEp/huNXhGmrHN9mFdUxCxloMfql1q1R
         KrJWpeKh94905Gk8TlLfVGeQ2sgX4Eqm1toRSJIEersUJ9dNjgQZ12h68oNZoJm0FpOQ
         9klgF3ZZurhZn/ZzRIdxk4APOphHSkU3ApAcULS7OimpxzU45GZZ/QBe0rwuSounOevG
         s8H9ZrQd8VjnPlekXmxXjFAzbtExgGNogwkniQEkrSLUsPfQyyZaXIPgvcBKA37gq1Ss
         T4LgeQBP8PKr5pv7J47AmQf74BzMx7KpRM79W/sLLBiSfxsO4/53OcqXhhcFeO3Ik5gv
         5FPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jy4ITIKArET/N50bQPN9FTLH59G9qDybtNKi0fRwPa8=;
        fh=xhdCNAjITSX/96nvGZ1APHJMQ6OC801Kh/50Z96RBiw=;
        b=IPHV6u7FYzWwXlT4bkhYALZbaEmqP9nve4RQF2JXgsU1O5P7Xq6q4i8O5oKbv8XnFW
         CNkXMciV8NOZfg+AAv+vzIxHyuxH9Yf7dRWl17V62qKP8gtoruZgKsi/JC5SDrS6a+AY
         zMWJKXiUiL8A5+fxmmbVLR0kXEGEKj9DL+Mj9Um3JmWPRm5BmWqmm5upWibHa1AHdeXe
         NRTo/2gttC6ckR9+zX3mhrxTxiLuKdU6NyyevKwBNf3kn2f+ATlsjxgw6+/DfeIYLrB/
         vZKLEsbet4Q05JLivZk4+HLDZoXaI1tEXV76MAcJfwvVD3iJoz6LxYYrKojYj4+/3GPM
         DrsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786934137; x=1787538937; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jy4ITIKArET/N50bQPN9FTLH59G9qDybtNKi0fRwPa8=;
        b=QdBHhIwQN1pnJQQ+wYHTFiVXG0mlKhAds5VsRpqARVB54zBFQ2zRStV4v3m1Tdn5g0
         moEqD+q4rGM32YQVRjT9WG1Q6Wq4mR9lkBK6FvKP9nDuKVJsonJflvAA6TO4fmWjviWR
         AKH2dDY5NVntiKqqD5O4Z/0NVmos+Ij5S9X4BAKj8jhBEIe4htx0LRac9hts/BzDj4yY
         AY0Q2K5Wu3G162BEJO2YZnMmL7SuNrGbizK/ppBXvlz40dmmoJaqsNj75hP1kYLXjxrC
         dodZA/3YVqIDhc9SFFiDcYQT9thHicxmbPC4pwqf9fHB6gXBL2eilnDPnCXd1qIowd9c
         fMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786934137; x=1787538937;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jy4ITIKArET/N50bQPN9FTLH59G9qDybtNKi0fRwPa8=;
        b=QHIazUrwRkekNBc0p5FbKGZ36rzqSKzZtoPd+JQbdzuLb48HRzL6BdcYMZ+KYjQ8LD
         8nnu0FqASNyCny+UO2e364BEbKuHLacjXWvUCLZSZL4efvxfzcN8pUMU+Go8bR8OOHEK
         CMfUCdILOLEl6s5xCQZ9v7yKlx54JyMfnRfcWS14ya6yE0mBrFdXOxV3YlSR9/8jyjf3
         VhQJLIqUJAnHwuwGH+dc/GxJhK2/gvvpvntaL3l2PWOq8kFRLAd4YtthhSVp0dfAXKYf
         XRj0LRc2Wj29enQN1hSg08jry1Dy2OYTT2x6hb8Ds6UeuM+76UA6MmR9zwOoVmwDXI26
         8n0g==
X-Gm-Message-State: AOJu0YyX4yt2DhFtZkUTMkqSuHn7X4XGNrmFtX5OfJ2ua3VrGMfVkEbb
	QyaONeuGZvoJc7JsKnrwNaWC1P8JDvO+DhquxyfUVOST8o3o+gQEXF8To5DEU/Tacit4Ii9YLZl
	jgZZmqJxnzNH5LITTBIoklNZ1u6/9x17nlRhj
X-Gm-Gg: AR+sD11141K/d8lNex8KWbkEvvrHvzyYQMEKXDq+UBZEOg9Tp9OF3sa7tWGn8fKb/zK
	8P3bOcVSU7Rd3Leqpw/k2Gz+tztNa77wCIkqOie8GCoq6hPWGEv8h7k6O4R6DuXiqGepuJcNupF
	7w/dDj+Mgt5BQ0+QX5JcTYyg/ihABWoXFzHvHIFW3R8pHJggd1pBMzxxFEZGVJ5i+sgnuIYZc+U
	CzKKKuAK6S7lKPHbKtumLBRUotetMhzV05GBOZ9pqgPAzrb0jQApVXS4Xzdgyw/JTJrbQOPsUWt
	D6oS3S6EIxQ8OnYSdRf0TaIi9/jQ9P40V7YtR2zzDUsEqb1tCXuvK79RvcTk
X-Received: by 2002:a05:6402:5058:b0:69f:4c65:86c2 with SMTP id
 4fb4d7f45d1cf-6a38a8dbf50mr9469813a12.2.1786934136860; Sun, 16 Aug 2026
 19:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEX=435pEyPHPjJgQnJUJLL8JJD65RsRa7Sjbx4NedZFG80dtA@mail.gmail.com>
 <71f66925-9a2e-4d95-87fe-eb11de78b215@gmail.com> <CAEX=436pkA5eG7N2MXpgE6kPL-Cbue3XeiLHOMPc2kFaxVj7ng@mail.gmail.com>
 <46295e2a-0e27-4936-a04a-2f8c71560740@gmail.com> <CAEX=436MOAPVPdqsupWFk5=2naeB1ghgRFCYi8FiLeGk9MLZDw@mail.gmail.com>
 <77155747-5550-468f-b8af-c25b713e9c14@gmail.com> <CAEX=436Nzf_NiHmuYcN8NpEnD1PdgtEz6qzLk_9wu9XHeSKeRw@mail.gmail.com>
 <83f9fcc0-f80c-4395-a513-34343162ef7e@gmail.com> <CAEX=43630i1znyzkfQNd21eiYOXsjDhmugejk7n+XrQenE-NHw@mail.gmail.com>
 <CAEX=435Oud97yous1cRA9rBbE5vtXvO7aCshx=kfJCQzoHZJjg@mail.gmail.com>
In-Reply-To: <CAEX=435Oud97yous1cRA9rBbE5vtXvO7aCshx=kfJCQzoHZJjg@mail.gmail.com>
From: Bheda Rahul <rahulbheda131313@gmail.com>
Date: Mon, 17 Aug 2026 08:05:24 +0530
X-Gm-Features: AcwNN1XJztfuEGCU6oCDlGjFRZzH-LQp_nWj4iDEJkhduJCn2rV77niIonbHnps
Message-ID: <CAEX=435jev98qs1tQdEci6Jkm-qAF0wo54jA8m+trNGski4P3Q@mail.gmail.com>
Subject: Re: [BUG] bitland-mifs-wmi: Power profiles not working on Xiaomi Mi
 NoteBook Ultra
To: Mingyou Chen <qby140326@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I also read the driver's description, which states that performance
mode is only supported when a DC barrel charger is connected. However,
this model only supports USB-C charging.
