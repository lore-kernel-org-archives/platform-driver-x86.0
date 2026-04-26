Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189AE2517AC
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777227726; cv=none; b=fmjImi0w7RCCuvw3vqeR7PeOjuN8t1K7dr/Mu8O8uFGPjj+dxXIztNdIPcOPoLmuH1U0YE07Z9kwfYCqpf4gzK1bwrsySIfuCifI2hgwIZQKcWhuqIOkKI8GvJUboVuVqGfZH2arEvfFpaePiVpANrqGn0tbrb2HW9aPa3aQoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777227726; c=relaxed/simple;
	bh=VTtRU7r9ZLGXtBxWjUtnG5wLJen74LMwEuI1tB5eHJ4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JWzj5wrJUFxWDLdNIWuGr+NOFKGo3/5iNu0bmxC1qFHM7VD1NRYj0TzWLPjgDtrEiVHbjx4tStMGmcnCo9a3HffbXFd0bUYS9MMt7MhcgraWXvVKMjqCc/1NfI4lUGezwNJ1Tdvx41uGTvEDzydd+yWCcgdUUp/bhGbdkY6ShUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYfeB9yp; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYfeB9yp"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2e221a71e19so9194162eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777227724; x=1777832524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VTtRU7r9ZLGXtBxWjUtnG5wLJen74LMwEuI1tB5eHJ4=;
        b=qYfeB9ypP/3+btNWkUaZqtihhA12iGoNlNo1BsvvRqniJhrVXnGsiozdslICSjsomX
         4vMU0jv7TeTB1G67Ywt7/IMZHLvtfsmSHqk1vxZEJaRDFew5pjoEpHAXE6z6W/4UpR+Y
         Uwwh7EQbuTbdZmMrX9/1eKmoRfXWon8WgEBARLVuKG4DPSvnGvVR3Sqmnbi1peYb6M7P
         OaGugjNKXvlY5+QIt7V5oEImb5SsqY1m85/zB3O8oRV5mbqG6co6RTvQMU0QWGtkR+ZZ
         UO3HZZJggf/UYg/wFYb9LdMr/NL9VQoPG7nhQxE0bdZ9aLz+WEge2PDoGLbB/JSAdHbP
         SaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777227724; x=1777832524;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTtRU7r9ZLGXtBxWjUtnG5wLJen74LMwEuI1tB5eHJ4=;
        b=FeDnO61PMer0ffR+bVlrzRBLzEzWrfz5HEJcZsXzPnYKxaj1FMoClC1Bx1HvNDM5lg
         WPuHBulVOwqldXbaMUWR0sMS785etAy+jskR90FxSd8OGy/JhFQyUWazRN7tjOA2z3eU
         yhdojMEKWzKDnGhdUbv1nCXfstIfhgSRr3jc2o6THGPk79E02gB4YtBIBTaPbr4dZLd/
         t24fDK78J5gYV8Fj4dsK4sGV1TmTT3gsHn4lVkESi6SeWC8MsNvj3tdgOD6HHXFP4Qtp
         PiqiNVrXide6ziPMpjkRvDNZB5jsNhsWF9zqT7CZczETJJ5DG09DmxRWRyZ/6WpmdT4m
         nqSQ==
X-Forwarded-Encrypted: i=1; AFNElJ96k2q/xpo0iYLKvDolc6CkXuXEyxYTtczlr07qQoPES6bBaXhrBhF/lS0S815gew0CGk2PJDokDVPXRfVduOZ4+sU9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5UCrtoKjkQN1FFkG1ldYV4djPf2n5y0GcB8nRvt16ziZziD3k
	OpSP/ci8dbg1M47SE0SjPFKz2/sjx/GSiiretBHr4S/ZE+uVtObENeyJ
X-Gm-Gg: AeBDievqCIJFaL5y+A9IHx2NvmxZw8JNhUlY7HKKJYfhaCi/GLxhVcK2VySaWh/Lvur
	HJtQONJA3ABTdGC/CGQ0mB2dKEvsXtwBb+t9PcxofLGQ4TY2m/ByKQ8DUjuis0CtOxikoDXa84w
	HYjxnVAxwvAjBUKDTszIfD7cIumRraVDB7q5XKwVz6dFQFQ83QXEkNLsJOYOxv5+S2rVW2nluhm
	MxF3LlZgdthogqqpZntmnFRzP78i+psb/Se4iR21dN/c2pi3CCc3kgabKAN7xmlLZzsSYzftxih
	vdjTjAoi7hLrmSR6qYWqbHTtWkSonuGgqJUH7R/YRJqG1R4fdXIFyoOdTROaUiDKc6sFM76fKzy
	JnJ5e0SmNVgrGvgGa6sNtqNezWgLQ9X/bMowmMQQz9V8HI2oYayPrPlazo6uo/WQ96wlAizipe9
	ef/++pW6AU7olGWyBAteeew3lMfNN6kXTC3qClqxFyO8YMjh7AWPHZ4AAm4G5p4LnVC/oEWbOXk
	htcBaBA43eC/W3dv8uCWrMJdB7xpCvTNzR9LUyIIjg=
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr9413326eec.17.1777227724075;
        Sun, 26 Apr 2026 11:22:04 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm40489472eec.28.2026.04.26.11.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 11:22:03 -0700 (PDT)
Date: Sun, 26 Apr 2026 11:22:04 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Yufei CHENG <cd345al@gmail.com>, mpearson-lenovo@squebb.ca, i@rong.moe
CC: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized
User-Agent: Thunderbird for Android
In-Reply-To: <20260426174332.9981-1-cd345al@gmail.com>
References: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe> <20260426174332.9981-1-cd345al@gmail.com>
Message-ID: <F095C80C-C233-4A50-ADC2-EC932563E1EC@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2026 10:43:32 AM PDT, Yufei CHENG <cd345al@gmail=2Ecom> wrote:
>Hi Rong,
>
>Thanks for your feedback, I've corrected the format and resend the patch=
=2E
>However I think I have to point out some other issues in this file=2E
>
>First, we should not complexify simple things=2E You use lwmi_om_fan_get_=
set() to
>combine get and set into a single function with a boolean flag to determi=
ne the
>action=2E
>This makes the control flow harder to follow and audit=2E Furthermore, th=
is layer
>of abstraction is not applied constantly throughout the whole file=2E In =
some
>places, values are set through lwmi_om_fan_get_set() and in other places,
>they're called manually through lwmi_dev_evaluate_int()
>This inconsistency makes the abstraction pointless and is the direct caus=
e of a
>second uninitialized bug
>
>In line 855, args=2Earg0 is set to attribute_id, but arg1 is never set=2E=
 Though
>arg1 is omitted in read action, you're still passing stack garbage to the
>lwmi_dev_evaluate_int()=2E And I think it's better to zero it out if not =
used=2E

Hi Yufei,

This bug is already addressed in a patch series that has been submitted an=
d is awaiting review from the subsystem maintainers=2E=20

>Additionally, I doubt whether bypassing the minimum RPM divisor has any
>practical use at all, not to mention it's not guranteed to work and purel=
y
>depends on whether EC accepts that sub-division value=2E
>
>I may do some refactor recently, and I'm happy to hear your suggestions=
=2E

Rong has a large refactor series queued up to simplify much of the driver =
already, pending the acceptance of the previously mentioned series=2E It wo=
uld be best to avoid doing any additional large refactoring until that seri=
es has landed=2E

Thanks,
Derek

>Thanks,
>Yufei
>

