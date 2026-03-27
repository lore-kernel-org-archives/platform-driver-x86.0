Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37933FFAAA
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633923; cv=none; b=MQhuMdUgPc5KQDZcT0IZ6Wvbz1Ncnlgv+4g6Qh8Xe81kqv9YkQx8It8QOfwv2gPWQwi4H37UB/n2349AxytWvCmmbgt5OfPU1Br1olTzZewRupScHYz41YvZSbBqvdPD969qboySzi0JLnykvKw5WIpj9VUvBYzCxAxAPjYbrhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633923; c=relaxed/simple;
	bh=+gdeq9IKfgSrIsFcJvpTInRojCXQwh7H40TUH165Zp8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uv9VvDE+l9ROuEAluivDaUUBbrWoARHX6qwEqjMOVCe5Ne9ngtFMloi0K1OwZh+0Wr8olnFWEuZzKmJ89i/dAKXw89HCA3ZrHcnWuI1JugNX3jOkDjNs8Wo/CPkMwOZurTKZ1YXdF1XCp6hJ58+l4eZuiMimzBj9xmGyt16AWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzJTeiXS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzJTeiXS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so26206915e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633920; x=1775238720; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+gdeq9IKfgSrIsFcJvpTInRojCXQwh7H40TUH165Zp8=;
        b=VzJTeiXSbfLierFYCD2OPk7KFHdl90CDshxORl/J3aCOkuLYRtmohjyZAaKeWOgGYQ
         5NiWcBhDLKiS83Z7+W//JIK08eFfNdVB1C8J5CVVi2M0wfK34NOCJ6/0atiKOObZJ6oA
         iEj6IXciFH41URaK4F0bZ4NPe8SB9AZjGT/75wYCpEfw+BK5IonERIe0XqtEUO8Xq4BI
         FIhLyGhbdZkDeMxy/b8/EzSqIw98f4JJGKmZcHa15GPc/yHlZZ5l2a0VG9CueNi1FKU/
         e29iGgE9fpNNNZwIBUoQZzDm9WZZGC4gs7/IT+i4VcAbAW0m+tPkBm7DEEkodvkH51lI
         222Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633920; x=1775238720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gdeq9IKfgSrIsFcJvpTInRojCXQwh7H40TUH165Zp8=;
        b=g/aH1f2v+Bi1DWEM9BVaTqi/NdVRrjOUjG0Y5r64hrDo5Aqmpr7NCMj5trsiGxsvdn
         Z8iZzwVzX7eZs2VVW4PJA379waGZBwc1xuN6mJySaM7FGG8GS0rMYe7bCdE1GGfjsxlZ
         s0GFu/sNktGOoaZwz2TvlOAiZJQQJKEYU8tgQoZ3QCBFbZtkSMdyFcI5oBRaiOKOzVe7
         z0/h21dB9brcoFw8+ePTHEVTvnkmY4uALDiph1dQPn7vCFq7lQoIszUtM2btXq9wuRo+
         fEq9zO5Aex3FyTyEpl7Ntakg5DdhC7Jd4xgr59lbXHHdl/apEzvO+ePfQBuDgGq3Ye65
         8ciA==
X-Forwarded-Encrypted: i=1; AJvYcCVTweJXWF/QIiUpZVGEicCHkfYxvHkUVycK7JHJLjAmSHsiW2M7HvWffkmgWojrv6gSn23nH1mkyWDmUfB70XyE6qmT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nub8zQ3o6XR0kksQwAe5iNeEedufJ3j4/2dpDpINxgcPDa0n
	Mm4sJe4buF0GvQu0psVlxe6NfkgdBdgcDG7dgbtRIHJ6y2wD3MMN7eEc
X-Gm-Gg: ATEYQzzcv+LInXRybdqobrhhHaT/Os3YuWeinH9kTfZWjMBvdky3jcTZgDcd9NRTwqL
	MF4hLc9ppyXpgIg2QFwbgGa/T1pOdOUKZuwfUZwyf8NyUfSggfRnukHAGBJgrZvvbnKlmwdF0y0
	XpNcX6a5HQMPhihE164nvq6OaYemMZCMIndCliWqeBaohWaRqcfA+lqRP0hmHi2KvhRUfRZ/huY
	o4f3ZwmLfP4lGs2NimrqxGv70m66lI7KMk2KWMdlgdv1iHZz/2jXWQhu1c+23Y0KFjbIsvZeTDU
	wcxsGkScuYP67qQPQ1VDo5mU0wvqx9lGSHz6ZNuSGHZPdSQ7xv2vR5K0UC01ADLOAUnryAoUY08
	lP9l5uXFmdpNRXmK7sLR1ILQrW5sPm3sK5gLefNrCAD6cL/Uhtjyz1zi8a6vj40RqIlB+V+T71V
	D4JD6aeOd15oun6XWZLmCqvzUD4g==
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr61339735e9.17.1774633919916;
        Fri, 27 Mar 2026 10:51:59 -0700 (PDT)
Received: from [10.245.244.175] ([134.191.227.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725ebe9dfsm30215925e9.4.2026.03.27.10.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:51:58 -0700 (PDT)
Message-ID: <4a19dd6c2ee07bf70ac136747e1ea5bfd8e41888.camel@gmail.com>
Subject: Re: [PATCH v1 0/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, hansg@kernel.org, 
	srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Date: Fri, 27 Mar 2026 19:51:54 +0200
In-Reply-To: <cover.1774625521.git.m.wieczorretman@pm.me>
References: <cover.1774625521.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-27 at 15:36 +0000, Maciej Wieczor-Retman wrote:
> on newer systems that can have multiple clusters on a single die, the
> intel-uncore-freq driver behaves differently and the domain_id is a
> globally unique value - unique on all TPMI devices. Therefore it's
> difficult to match a specific instance to a set of UFS registers for
> example visible through /sys/kernel/debug/tpmi directories.

Although, I'd say that the key point isn't that "domain_id is globally
unique" (though this is true), but that it's a synthetic value
generated by the driver rather than representing an actual HW instance
ID.

Artem.
