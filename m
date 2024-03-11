Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E026B3FE28
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Mar 2024 22:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710196374; cv=none; b=hQADiIacAwfbD9PYrf7+HdRMPrQL051MnNfHRLD5OC9tSa/L+qAYJ92I8f4FTZ678+Zzia4QZVjt4m1Gw6e/FsNUrHixWdhj4maZgN+OU1OZEoJs075/UdVa8UrzeTAXBoIDvYpmbalYDGYzomNGZFZRzHtu+cJHK9zQmjJw9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710196374; c=relaxed/simple;
	bh=vwLn6pPMKhnjkaMcj/WgdNDx63eGUSsPz3XGpaNFawk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WXoa2YvinUzypZYnfPy2aBwwHrgI2VKrX8seR68YEUZjlpmmQskSNHY8PfaVQMsE8vgjTCm08BH00HNDyFbseiXGI5G8T12aDuout++ixBcCEjMItGcAoDq7h66TIVbdkcGdbSfAcalzIs+qwFNVZhbAAyHeUBn1O+vYPbUynQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=CBzOWzWW; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="CBzOWzWW"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7810827e54eso373784185a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Mar 2024 15:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1710196372; x=1710801172; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CArm0auKmwv8Q1uxyRuXJ0PLf8GkQNTL9Enxue9llQA=;
        b=CBzOWzWW/6z//lsY6fsPIVmmAg+pRQcPz7N4wMC70sBXg5tlcq+1W+fBgiIbPlIdST
         eflgfFFuxmCZs/wT2EUAAr7lQkC4li4GMHO5BjqFATJfo1mNYr3WBP4vT2QeFTPfKAzC
         73hU47t+bwpbzxfts6aJKoVlW0cb+H6e4+Ync=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710196372; x=1710801172;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CArm0auKmwv8Q1uxyRuXJ0PLf8GkQNTL9Enxue9llQA=;
        b=GKcWZkJD3qqDZxCrDNxbgto0hfDRDFlwd3kDo1v+kEvteNmRHjhc6okbYRoEg75e0G
         W9XcFHzEs2uidboEAXknjrHN+8ufeYH1xDpe30K7lFxifIYWsEZKU7Pu3v0TUcX5Wnc0
         OV17Lb0769jEQhOg2r54jLQV6vMuTgW4DTH8gHKEeeaUzQtJBWHroq++/dHM8FYdEyb2
         V2LWOubl1kA3Re4LwR0Mnv+hH10Q+R2ZVVh4W/pWL7qDFjBTJG1wXqrlS+GPvuwRMnJp
         GaIpqe2ClDnwCijNtTSvM3EYj6hJQTuG1ACn0CIjDM9spfBrwj7ElD0UppBUhtJqSFyT
         yEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVNCITQSSbFhEDsqNCGeuJ/1DzqICpcVGqeVLGTvyWvzvQSaWCLvQPR0njl8CaZXXVs/5wMqqmvAtClQrBaNaR+zdNPLYkOpmS4HZNfkXm/tbF3Q==
X-Gm-Message-State: AOJu0YypnI4cVLjrBi6kNFgbZuHojplqNrYUGfa80XPw+S/cnDz9kgWu
	NjgFgmSXVy9KjAAXYQpwVplVixrreojaGvPixrwhhFvWyvrNFDhAmxTCqw4Prqw=
X-Google-Smtp-Source: AGHT+IEKvHUH5Vn2Ya7dsxvRmBmETgiXKV1KVbATb/H14J5Tw1iznBmhd4clegC+uNQb6ptxpPNBRg==
X-Received: by 2002:a05:620a:2455:b0:788:25bc:622d with SMTP id h21-20020a05620a245500b0078825bc622dmr11477842qkn.55.1710196371783;
        Mon, 11 Mar 2024 15:32:51 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id h27-20020a05620a13fb00b00787930320b6sm3096198qkl.70.2024.03.11.15.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 15:32:51 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: ilpo.jarvinen@linux.intel.com
Cc: hdegoede@redhat.com,
	ivor@iwanders.net,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/surface: platform_profile: add fan profile switching
Date: Mon, 11 Mar 2024 18:32:30 -0400
Message-Id: <20240311223230.4653-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <fa16bf5a-b0da-2751-7109-fe76acbcd7d8@linux.intel.com>
References: <fa16bf5a-b0da-2751-7109-fe76acbcd7d8@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

> Is char correct type here or do you perhaps mean e.g., u8 that is more 
approriate for 1-byte long binary data? [...] u8 ?

Thanks for the review Ilpo. Agreed, u8 would be better, I also noticed that
this variable, and the profile_le one in the function just above it can be
const, I'll change this type to u8 and make both profile variable const in v2.

~Ivor
