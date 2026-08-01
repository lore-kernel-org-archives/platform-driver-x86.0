Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC428688C
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594030; cv=none; b=mxDJEZrsqeI+7PZi2HXW5kXqR4j2rHStDW3jtDBEhDRj4/64cKEY9ebAl91cuRbnrp9Rj4yvNbPmX04TiMipKWwgCo4wr54tERkqwOAYXYthmqembnJe+NK1VaCa/qjk/PP3HyaNu5xczt6JutgGv3MC/BCWkNBBJFA/xBnPxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594030; c=relaxed/simple;
	bh=Ndz2aZDvn0okQg8nupjAf2Jth6vrHHqdLpqVsULKnNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8QwkJ1uuUHI35iUrpSktyi28AfDUNH9X24hkAVEYgf7rMmZhNW2gCsOqdVNMmDWKtjnerLG9NJfYxEuMGXZObxYVRl8y1h2RSIyTsdS6oECCH3WCwprKVOGUadPWmb10l/0K0eAutkLHCHBwCKdouNLUhnI87ewigJvEa7sVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUyMqAb+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUyMqAb+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476a130c138so2338953f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Aug 2026 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594027; x=1786198827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ndz2aZDvn0okQg8nupjAf2Jth6vrHHqdLpqVsULKnNM=;
        b=PUyMqAb+7HyrdWCf8Sv9infqEDJ32MieAAo6Enm79bIeCLcytxSNhukV0fuShojBpB
         uBNfWOdbljVd0cjzizCqPSjezm6vdCDhe0iFrkhOTIS8OAJSyBli5W4FM57I9w6ba7SK
         hNYJHq5NwPYZlINWHD8NMttgGhOAXXE2MbX5d7vK17BgPtfEO7FQS9utH6/Mi+dQsDyn
         s1nLJ20niw0WqT/W2gPMK8BKphwS8Sg7UoOoVq1Egz6z4w0evGOenj6pfrlnWs6Jy7CZ
         fKsGbLmz5Je2ro1b+VTl7TUxD0+WZ/rqpHN+z21sqKlUTJuURza8bCgwGXw/c+X2Euif
         VS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594027; x=1786198827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ndz2aZDvn0okQg8nupjAf2Jth6vrHHqdLpqVsULKnNM=;
        b=oULbpgy5S0vZHZM1FbnHGssq5ljGo3/4/3374+ORh1puJ0hHIm9fQcoetLmmegtght
         yAyKZyIyq61R+D6dijKhnkzicKUQ85Y8P6oLbM6AXY2smx8vhLaONbZtO3h7E7l4pkXT
         NyX4MDLdTK7SqA7qS7MM65woiM3+cVCghPLoP5trOrUfq00P1iri5D3h2Seay4W/kGGi
         QSjoj+wNXmPQE7AgaFDQi1aori8+e8AgmzsLUyxAHvORwhihIqbDCww4XbEWarioxxkw
         nSzHSxUJdYCPKC/ZdCiGxmFtYKgohXxZjcNfFZtZvH+gSZ64ZrJjiiNCVsRv5degKIuj
         oQsA==
X-Gm-Message-State: AOJu0YyZK8c3rN4ASW455j+FcpL7kPYX46JK/u0XQPsKLsr389DcK3lr
	C4qqWCVzmLaMkoxnZnZfVj7Tj8lgIarDWOA6f2+DFRS8uVW/L6LMIHCU
X-Gm-Gg: AR+sD1201/oHwyt5alf0MOg3XeJ7Q6BAXLBdnJZnYrvWFZq/aGzX7F8U8aIKCqoA+r9
	qG4P1GNXbL8LqbJ9VyjbVI/rth17aKEObtg2nvJZH86iQ8z1eRW+sR7cFqE+lOptgCCCSmjdxBI
	dTyprhHI+GfMaV8IaBx1tQWN1dIDJEp24uuKzkx6wxDWa3M904U/Ic62CGn4a8gFUeBDcl5qeul
	pqYU59X9otNdJHPQ8zEpOtUGrXwvGRTqgI62GdcBlOI+twzbHaAeJSHQS+1A2dHmEno+zOkCw+K
	mdzLXLJ+yXLjpYAJo1LUlQGSyc+gfELYyrvR/j4GFft486vXmYmYyGQV4rP9jYXlk0nY1BLKrAE
	A7FRoQiAfZjju6wTKk+4sneNAD8rL1ipfwH1SGmJDIjm01jGXEQHrQhjUvuT0VDJlU5NwJ9+21K
	gH4KySWtTHZmkhimb8ALaJaQIWviePomCFRYGM+TcTry/A0xbUohq2V9w3GfAyTm3VCCTHkdDlW
	FNTSdR7PBbnK1Xsqw1tkyrvzCs9mg0v9GRfMPmNBkUorzFHX3l0FgzeGfZidzsV8oJMOl4H
X-Received: by 2002:a05:6000:4701:b0:47f:93b6:8d05 with SMTP id ffacd0b85a97d-47fd724e8d9mr8844025f8f.0.1785594027448;
        Sat, 01 Aug 2026 07:20:27 -0700 (PDT)
Received: from fedora.cable.virginm.net (cpc89770-stok19-2-0-cust13393.1-4.cable.virginm.net. [86.23.116.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1240sm15247471f8f.36.2026.08.01.07.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:20:27 -0700 (PDT)
From: yahia ahmed <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
Date: Sat,  1 Aug 2026 15:20:25 +0100
Message-ID: <20260801142025.15515-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <eca5ecb2-7306-4dc6-bda1-faa35220b79b@gmx.de>
References: <eca5ecb2-7306-4dc6-bda1-faa35220b79b@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently hp_bioscfg and hp_wmi will both collide to register in the
5FB7F034-2C63-45E9-BE91-3D44E2C707E4 GUID, so if we modernize to use
the wmi interface we will lock one of the drivers out, So how should
we optimally handle them?

Best regards,
yahia
