Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E254195811
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 00:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778459161; cv=none; b=YBuvmvYZIJVyM2X5GWcJHKOR9XLPOMZHZXd/47YHUo8/vBCFdCbifnj+vvB/Gb003kfkKNivPgrjriG/+n97dXAekNbpYarQ1hjiWyHxfC+1yevlGB2pE+5+VpAUe11n8h59B/D6xny5h6MiW8Rig/OR/c8I9xMUVnyGtuWfvjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778459161; c=relaxed/simple;
	bh=JY7Cs/YULHAKWuOSgLIYEw5jgkdNFbUL4wYawMmGFrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfZbJtWWSyINXatAXIzKJHnKaNy/czRsLH7ab0qcUGGqx7MsZpDSrp3ZDDViPauHmz5oprdPg1Ah1tJq/CkKWfgDbDJmaIXbIMGciR9db8m7/hkL+yZ40Wry6VCQObEpiuK6agaRYvRju/arzRCgJHOaZCE3VCKgAhszkJz9huM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el1pVSW7; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el1pVSW7"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3809851eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 17:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778459159; x=1779063959; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxkiHdPMvNJ5QnF+RlI4BbDlXBZhXOVr0RVnxR0vkiY=;
        b=el1pVSW7zCEcpRPZ+si+yV7CsTqsv4YQN/wT4wYypp3DVrn3D3owRaUlA1n7MKv6ql
         /X4rX8+jfyx1aA1Dkk+ts6/gmslP9dwOhJK7yIGfm4geq3x49HFscTl7YBpCbNKXtzY2
         iGsg9Pvh72tr/vzUVju7vtuChKRKra0UoOVKbPG2ZalenGRetgiawaZ4zVAAQttmUdZX
         gQbUbL56MezbyeFyeER99cyNfQM1/3Lum3p9OQEydmx6Auj28H8syMnsPm1DHEUC99yL
         BCW3Tx0wBpt50T3LdcByyOoiiokAGAlK08CtMwIhjnOwEFWfFjMMvWwpvhwRy8eaYaKt
         oE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778459159; x=1779063959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxkiHdPMvNJ5QnF+RlI4BbDlXBZhXOVr0RVnxR0vkiY=;
        b=g0E/HQCBemxOOFERSVnXgtknyVoEKdlhp/G9bllgI5oPbAdEzcUl+GCy30SJK2tJdu
         1BlB+xnZMjshMf3+0xp7BSwVpQIblG3lTZMJxzA50RXyIEufLonL6bJzQRnyRuQUIYUa
         YQIGqWljfWC5OICN8SUgYVnqIAzbTcw9/S6ltu7HKfJqbuOnrkwg3opsyV3Jfj/k6ISq
         RY5a9bWdOdBtKoOFR09sNypFgSPHhUi0lp+fajG2sy4na8Wzr83KUHejdJRj8STW6jic
         vuRDaQ8g6Hp//6gQAwdGEB2R4Br1MCimNxYvdxPO1IW7WYXbCY3cH0/QAG6mUwB9TQWf
         gp4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/3nb+eO9KBKxtFMdW5974X2BujTMovXuyX6vd0DwXN7KThNs3sfBL/3QOt5DCuC9VSZf9CN4up+FXFpJaRQlkgiklR@vger.kernel.org
X-Gm-Message-State: AOJu0YyU2PK4+zxSd6b3/NoFKl3elZpbn3D842+kKWpi8Z0UPh2p/5s+
	9NKKhpcuZC1sJk29nyS3/ABKj51v2XDUbXC+tEfNtbpfpc6EhbNyhHVN
X-Gm-Gg: Acq92OEzVuUUOJQh7hu9rp6+Vfg187RH8vDlIvoawF7VJYY7Edn18uRu7d+T96d2x/L
	tVrj7Ztbd/ZVBp+6bwpvGxzFAwSTlvW11FVtMDFUTxTBKuD2WuzqbEhCa1CO8LFxCUPP0B2PwMr
	EOgE8g4NLUGG5IoQnZZO/KbasE0kgA7WbuCyBbg2CzRiu5sB1xISJAdQ/pRWUc6KNiD3Fg0ZIhM
	WRQWGm64CTTeG33xm6AEXaMWCoJYtJFxA9iHXEW9pZYYV9UOTch6YlU4bhJRBE3dGaTyBPK9Nzd
	5bbE+rdLQ3fopNIyB9uPqWP+Lcnb8VasMvNWvE3sVkh552lNRy861OXNy6UchiJw7KIIpa62y6T
	99NmbRXLmb4my5s59MwS6dq1eILz8QnGKyWs1k4619JanzUNe2Es83I73KJrhk4y9DpIIUy+IyE
	1g39hwBGIvBnRsxz79Zzlv9Jj3Vwlq+Uz1ORltKQ==
X-Received: by 2002:a05:7301:578d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2f54869c91amr9854100eec.13.1778459159350;
        Sun, 10 May 2026 17:25:59 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:a86c:e959:dc9e:d86c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884750ffsm11279234eec.19.2026.05.10.17.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 17:25:59 -0700 (PDT)
Date: Sun, 10 May 2026 21:25:56 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
Message-ID: <agEiFJ0hpmuo0EJu@djouze-zen>
References: <adg6GzkykThAB_4u@djouze-zen>
 <ce2a2f37-ad8a-647c-0db8-83f6efd99f12@linux.intel.com>
 <afFAvIbAS6ue3ZaF@djouze-zen>
 <cd3fc0ef-c15a-8f41-9162-c042daa44969@linux.intel.com>
 <afvAvE-yhB6L53H8@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afvAvE-yhB6L53H8@djouze-zen>

On Wed, May 06, 2026 at 07:29:16PM -0300, José Guilherme de Castro Rodrigues wrote:
> On Wed, May 06, 2026 at 04:18:39PM +0300, Ilpo Järvinen wrote:
> > 
> > So if I understood you correctly with LED_NEG (unknown if it's just on 
> > your device or generally with it),
> > 
> > This doesn't work: set
> > This works: set+get
> 
> Yes, that is correct.
> 

Actually, sorry. No, that is not correct. I was pretty sure that did
work, but I must've mixed something up... probably because I tried that
only before I sent the first patch.

I can't get the set operation to work at all. So I end up only being
able to read the brightness in the device exposed to userspace.

I don't really have the knowledge to debug the wmi call, so that is
definitely a dead end for me.


Best Regards,
José Rodrigues
