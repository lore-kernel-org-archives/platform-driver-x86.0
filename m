Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B6523E320
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945516; cv=none; b=lU4mZyPqpYYcBuh1MKbapmxgHW50p1Jk5JHzhssBhAzECgce2iPltyd3zIBxoOdVZ8bLvRBEuQiKtWTPCzjVWSvwPg08NaDYuJ3genIRqNnC0U5hKSlyqk64rB8Zgt3rw3ZZdsHEnaMskqHp8fiaiGju4XlpMqfJrrmjm9h/9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945516; c=relaxed/simple;
	bh=zEQw9EzLJfdU0N6hQoXrThJLRbefFVlSvhYTIjcEwWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEv0Vi8lsIeUsTlwpJtzNCor3VNSMLrws8CDdS1IOP+U9P3yq9jtde0Bris368QHrF7b49GuzmKA+yHiXdH53Qy4lVa8YYICfzivyj1MC1XZfYnkCSJ2tzDZ39s0cb7XIByQoUUvaJqZj6oEjC46ksPni/AWoQDYBJsFe1Y1Lzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GP2emADW; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GP2emADW"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5176d4c14f5so39469031cf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780945514; x=1781550314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHfJg8I40AyrFWL2HTXVtd3AE1IeaVRWavtCFPKxV9Y=;
        b=GP2emADWJmk4QH3D0vRVdwcxcfa2Z43DiMAKcSbzRPC3MIi7B2mStf7PoEgSvy0ZMD
         hViY+anxcZ3cSz1yLR92jZ8utCmHGq4GC1Oz5hB9z61nCkISVntnTo0jpiZiww8kQPwz
         eeuoOQ9wWUMx1ZyEzyRGSyv9i6efVYO83OA+O/bQXPZsfPw8NHnFKE0w9MY+F636XmfV
         YMgFyam8ueJuu3GHD3HTCGglOZVoleAPXxOMhzlELKfpaJklwFvGmm65DWxa8KoWoGDg
         QovHLlXiimJSN0/kn5J+F1WPWmfPzYZe/Ufzp1clAKtuBdSS8L/sGMoEMVjpEaSi4X0T
         zQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945514; x=1781550314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHfJg8I40AyrFWL2HTXVtd3AE1IeaVRWavtCFPKxV9Y=;
        b=m1iSMYfZXrxcUdydMNh0Ok/ArQAk96ryTxSR8wxFh2dNUlGR4OUtoTmWYIvgosxEW9
         kFnUhME4/CRZi+ER5KDBJVA7bZDwBKbdPlOgUiGdBssU43BfY1CZF7eRDpxtpf/dRMBD
         Gvgj3eIzIw7qMPm2W8PMPbK42MQXObDqcjZzj96Uoc/QC4r3hlT70+D2ktU5mgtYnIAH
         fGHXuLABsKbetiTj47Uh8yBsfIZpLAVuQ4H85LF7wCfGQ5lN1wBVJd2YBq3Ldq0iRrck
         abvuLbaihvsDNoX/1lCRsrZffH0I5ubKHO4ZvULgFMRQmLh3b1RYx3VK0R1nlJPbEl+X
         mv+w==
X-Gm-Message-State: AOJu0YxtQj24dJIA/gGngn949U0yWcgwQYYbNLac/r9tl2Lv+9vXK0vd
	jqwAKfnXdaV13YkIJKRGPOwZpNXq7BGit+DF2n1vlbVpfIxHsaljUVHl
X-Gm-Gg: Acq92OEToPoECknq0ornPw941TabD6KwA4pcisBmrYDOiF+dT/lEma1SnzmUN9XZDlT
	r66sqMXLUF1/cbvllNHm2u9HNtBmlluc7B8RYmS0r8EvWVa7CZwpzf2MUx4hxYqwGab0NsRd94E
	5sUi/fcDPmyBBjSKFGlXgEuXZ7DAmoGFEQKBhGBPNT5V9WeJ4vt0PFPP8t/8EL/cKJXwfn9RnEz
	R1u+RbecstpcGhomh8PLYvmYyKg6OIkYOlbI8eCnSDtvUJSSZV+SewQBKQ7JheQ7gComMQdITxZ
	NHin09FHRWaCXbXktzBoPrCDm++msaLol78CRQX+WMxQMl2QqVUa79kxYFNjdpAa2oZFHZXGDF0
	SWVyXmq9VWmcLZ3Fkxd47gN6Q8k6jpRNNjHS2aSHi50wX89ZBn5ehpLAGhh0FOXH567fRdk2nVj
	DCmJCr4XiIQgiXNq0ZAI50PUIBY38zoV5rcxshT/FOXhnGck5paJXOmjzUY2BveFr4xo4hAtVkj
	CITqlARwpb092l8gw==
X-Received: by 2002:a05:622a:1187:b0:517:c65c:488b with SMTP id d75a77b69052e-517c65c771emr13993181cf.0.1780945514369;
        Mon, 08 Jun 2026 12:05:14 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775df4dd6sm160482541cf.27.2026.06.08.12.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:05:13 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: platform-driver-x86@vger.kernel.org,
	pithenrich2d@googlemail.com,
	mpearson-lenovo@squebb.ca,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: Re: [PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Mon,  8 Jun 2026 15:05:07 -0400
Message-ID: <20260608190507.77836-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <dda1efcd-f7f5-4ed5-9481-5047d43924cc@oss.qualcomm.com>
References: <20260521144034.282419-1-carvsdriver@gmail.com> <20260527122701.242907-1-carvsdriver@gmail.com> <78833ba9-7ea0-4c7f-8d41-ac0fd64ba15c@oss.qualcomm.com> <20260608125211.11957-1-carvsdriver@gmail.com> <dda1efcd-f7f5-4ed5-9481-5047d43924cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans,

Confirmed: on the YB9, both lenovo-ymc and yb9-kbdock register input
nodes with SW_TABLET_MODE in their capability bitmap (SW=2 in
/proc/bus/input/devices). You are right that this is a problem
regardless of which one fires events -- GNOME reads the capability at
startup.

The recommended fix would be: add a DMI blocklist to lenovo_ymc_probe()
to return early on the Yoga Book 9, matching on:

    DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
    DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),

That leaves yb9-kbdock as the sole SW_TABLET_MODE source on this
hardware.

Two questions on how you'd like to proceed:

1. Should the lenovo-ymc fix come as a standalone patch, or would you
   prefer a v6 2-patch series with the ymc change as patch 1/2 and the
   kbdock driver as patch 2/2?

2. For the early return in probe(): you suggested "return 0" to avoid
   WMI framework error messages. That requires a NULL guard in
   lenovo_ymc_notify() since priv is never set in that path. Is that
   the right approach, or would you prefer a different pattern?

Thanks,
Dave
