Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43730CDB4
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 22:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756249029; cv=none; b=C2kTCq6LOHqAH+oRrwi9RbUjbPzFXePPIv447tKQyRwqI7ZOeap9HxO7JRRN+SezgFQ+U0obKsWNDsxcururjQ6oB42Rga8HxCVaDso7JWKzhzudSOv1EsQezAt2O544yCOGvXtPCY4cPh1BWVUi5rcnFyyb6Jur26+BqMzkdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756249029; c=relaxed/simple;
	bh=1T2KwS4vEIjeix/pRgprYteTl3PPsk/p4+lmU/y+QLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtyYzLC8ZbveBIlTX1OrtvMiyMGQZzogGIJ6A/S3ZRqGL2nx59Ui6emqJ/Fz6P5vHDolu2b2GozpIxELckTRpAgpt+PrLGEkw4hu7MNl5MhZBVVaGZFVOoqh+MF1wC4/oZmbFBSfpA2uPo9GUkhWG6GD8nhigZXJofDYJRBtClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/YYJn2T; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/YYJn2T"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5446e38eb64so62278e0c.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756249027; x=1756853827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1T2KwS4vEIjeix/pRgprYteTl3PPsk/p4+lmU/y+QLI=;
        b=k/YYJn2TdtipRpSz5KPBjKNzyYpEs1acxE13O/XfkSamAjT2HbXKRIoqDLgklTmjy9
         KIcfiMKr3r+xCR3pUpXNmTcPAc8O1UrcTYVDYLQus0VP6VbodM60whKIkVi+nqcZxTJT
         qzgcQQyxvl73RXXqXjOzmUwHnjB83q/sjm2cmjIUwZ1Vs5rq/LFwY/WPmWSeNMws8F9a
         hYt+zCyozbyCrl71IVLH32seB0RzSFoENinjnIyvcUa3/mYgFatYixThypE9wIvsAJZl
         AeceHb2r1xm9KDN7QE4W3pKWf1E6TqAfy/Tk/54cbizsqvbflInyFHrIkPu64MWB2ISB
         kM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756249027; x=1756853827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1T2KwS4vEIjeix/pRgprYteTl3PPsk/p4+lmU/y+QLI=;
        b=LmlWv7xsS+b48Dd2VC02a7BZ+0BIkpTXgyIiyjqbd8L9N8guD/dNRXK6bgKQeDD7Yy
         z9vYqlipe9Z465ZQdn3zGvMwS/mh02QR1X3hcopznd0qWs8xx+a8eQdvvq/ia3o7NFtZ
         aNyt8y8AGshIIEwz1CjRjzgCjahI7OOnWGMcRRmaldoPZsQjaCUviuRLNEnTaefxmbqO
         Ntk0QkSwXX/UkQFTHOjd6dX0EiCI8yZesnAyU7eWMLPKCY2jplG99ZKZOxH1Q30afZDt
         AZ7IaLJ0hyWGq7+0s8dbFVIUMhOtGXPXJUpnkcLe1iNUHC3BSEtorA1ZJ50GZp4RArn4
         1FeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg7IqheqIhltA9Ri5BFRxnh21jNFqvlR/gjXZTSlIwrgwwvJ4G0x5bJPEBEO8JvbQ3seBWvDG42aSA/cxmgzkz/RF0@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0hohYOP9QZght7DUFlBLGN1WLOJ4R8MTuyueLTaZSvDAGegt
	TqDU1X0NDcAArM+mkFcJRI+qi+25fn6pvixsaQ/GRxgYxSfOYL0QGqPuIkIC33OEky3WDYRLr5Q
	R+Rj9TrgE79hJatBF1sy6wmCJi56ybHw=
X-Gm-Gg: ASbGncte80gSt4fjBIZ2+9hDrfextNy0THa5vsU2AqCq7WW7T2s4QGbgTB4P8cnNlns
	+o8U2pbb9I5pjCq/s2b9QKWxNrFZb3HGKe/kjul46BVBfjChmRRAIS1UDa2cr+s0mRuiPOwwFuZ
	E1/HVi+TPnyXBZERD+TVr4vaxvjoJFfcdaCTs44iAOnnLKo08Oeo5jkZyrn5uIpCiEi0GHWSG9s
	cue2v5XIvdupCpynqxH+Q==
X-Google-Smtp-Source: AGHT+IEtF5q0wjtuAFjuqAL0K+hFjS+BybXmE+EmyssLiMN245AjU9IQ3JfQ3Gfz2W/+QTmsnIOqH2zMhTet3nFlFZQ=
X-Received: by 2002:a05:6122:8617:b0:53f:7828:16ac with SMTP id
 71dfb90a1353d-53f78281b18mr4261439e0c.13.1756249026877; Tue, 26 Aug 2025
 15:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731213529.27378-1-noahpro@gmail.com> <80eb0a87-6f21-8276-5349-50745c7c0840@linux.intel.com>
 <CALjHL5-tjMkiAYJ1gtehtHMj+gySVthJSnCcM1iUNndRoBxEDg@mail.gmail.com>
In-Reply-To: <CALjHL5-tjMkiAYJ1gtehtHMj+gySVthJSnCcM1iUNndRoBxEDg@mail.gmail.com>
From: Noah Provenzano <noahpro@gmail.com>
Date: Tue, 26 Aug 2025 18:56:56 -0400
X-Gm-Features: Ac12FXxg8ZH9Bi1zUh5rrjebDtN2k1yLQxkna7xMuAq4hzYUzdSasgEH5Y7VLP4
Message-ID: <CALjHL5-Ez8i2CV12rBHxYuO7osvAVce3iPE3nc_=AaebXyBW6Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add Omen 16-wf0xxx (board 8BAB) fan
 & perf-profile support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I agree the constant checking of env vars does feel suboptimal. I am
not sure of the best way to go about this. Could you give some advice
perhaps or point me toward someone else willing to help with this?
Thanks
