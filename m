Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D641F75B5
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457336; cv=none; b=ZoZLJ9fPwMaMLy6dm5ZYRiDxdDsQbBvJb4TJPBJNHm6zJmigme1AlpVpvOuDWJzq5OGIaadQrGFrU+D7/xfEQ/D84Ri2tvvc1gW8kU+HOOlmumU6AX8jHp3onRVk+3X5GfwUEcyT5dzTls6unC2BA31YhtkVPYEXvvRTtROxQlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457336; c=relaxed/simple;
	bh=+FoC4TzW8bYNkefFsH5wtU59UmmY013IpZJwq7zo/tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1ls0dKsK6IJkSC5Kh5Ia/AVm1I1TsU12C64vqIhJ5sGfatUYU2v7Kfxci2WXlmF6A2t7lvv2kcQGu+wI0VqzpVvAaM0+v4NzbXa8IPyboBJsXvkj6S7rHAcGxxv8GjU0AsJjsj36KZg5Vqw06SiBUGZYxbXpNY3NJ1ICn/7hZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqBO5mC5; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqBO5mC5"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd526d4d9eso4337527a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 09:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734457333; x=1735062133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FoC4TzW8bYNkefFsH5wtU59UmmY013IpZJwq7zo/tE=;
        b=lqBO5mC5Or/QEBc1AX+ZoQSxzXI0A8zoQLSMtmYGo91bk7DdRrmFKqYcOgWD6Jv1S9
         nTkZHzzLXy37HHszYxOs0DOwE8aBS9xYu1Vm4b5krodeo9oF28MC6+A/vVENamrShDQl
         pvydAr+zFj/IOFEFN+NKuiSedUxjUnEwLFGmpbEaglfAYrHCdlzQSq8VuETku988dN5D
         c2MbyEwe6AwCRyp01ocxIKmVnniBC/g1WVP2RhiBC1TQLGSrGrLP5vJ7qGhUPZ9Q2hc8
         BFwUvYypKZGDkfaL+O+okNl6SdhxRfx1+fCKB+YTbItNMQnhEgEu0OZFX9YmrU9TjAOd
         x2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734457333; x=1735062133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FoC4TzW8bYNkefFsH5wtU59UmmY013IpZJwq7zo/tE=;
        b=KszcFtAcqM9DyhqBX7GAAQywfv8JyD+gx3vIVJ+g3bewQlTOhSzbiPj4xDGvBkqFNO
         Xz4QPwtSiG1nvR9ekeg4uiVSBBCe4nMmPEPumXFLsTpq4fvJaswf+CE7O61j76wb1yjh
         C2ryAeBtCD5aJYn9BOj4XqMBOFTC6RyHHKz5CPwh13FKJpJ4OgQA2/erugOGN3/It8Ay
         /jOSpNr2NkJq1B3WUmZ5drUOXbcWgQMDyk1kivrRuHU1mBdlKjvv3TC22HmFBS59hZ/f
         1QcjZGB6xHCaxdXbw7x8UrzwEDrVcu+pWmigBBCnhkbJI/WWQ4R0+mqWyFFQS+WdNqNc
         GdaQ==
X-Gm-Message-State: AOJu0YyD4i9Ll143C4IIGpzt1nqswJOJFbPF4JLvZFmrmjoCuHnOkNhM
	mm+rYZcvFeUfxcDBNRFfGLv3mZu9rvyHjI3JQsRH+HVAoirPsUASpTPWl+1ox7zAg7RththCXjU
	yWC+5W7LPJyU80LBjzwTkfZ3mVQM=
X-Gm-Gg: ASbGncvLSgVbKOch+ICwLuXM8JnePFrgV2bNLaW7qq1xBSbWdV6Rj0uDXblmMSPHz01
	mGZSmtPDBi2/2o3BDKpnHCWDNjjJKBKuWGh0nEfUl
X-Google-Smtp-Source: AGHT+IE71jlXfIdRG7DMvW18ppSOJPP4cWQqMkkTzw5vitt+osx/JLrAM4tmDgWIcUqI7yITHAAhjif8oV5LO8aTB2M=
X-Received: by 2002:a17:90b:4a4f:b0:2ee:9902:18b4 with SMTP id
 98e67ed59e1d1-2f2900a9878mr24881218a91.27.1734457333277; Tue, 17 Dec 2024
 09:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de> <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
In-Reply-To: <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Tue, 17 Dec 2024 23:11:37 +0530
Message-ID: <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 6:58=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
> This seems to be caused by an oddly named ACPI table ("$H20"). I will ask=
 the
> ACPICA guys if this check can be relaxed. Other than that this error is h=
armless.

Thanks,

> It also seems that the ACPI code contains the necessary logic to submit a=
n turbo mode
> WMI event. I suspect that some settings have to be enabled first.
Okay that's interesting, I did catch a WMI call on windows (it was
something named APge action iirc) when the turbo button was pressed.
I'm guessing this means that I will have to learn ACPI and how linux
implements it if i wish to debug this issue.


> The thermal control should be handled by thermald.
I don't have thermald installed, afaik the only thing responsible for
managing cpu clock speeds right now is intel_pstate.
