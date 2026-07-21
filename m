Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242843E7141
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655100; cv=none; b=j/w/e6mXV9ALlDtERInXTgcKs0GkxcelczfoL1/OlqqpF/jDIB0zhrvShEo9vyLyI2bxc0+anfJKW559wmUoY2GLh2wcO4jTIn3IJKbaZ/vE59SREzO65EwtWm5NL1SZB58OVO6gXYKl4kQ5p+jdmhVDS82kYCRLNPDssiCeX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655100; c=relaxed/simple;
	bh=6nsqek6AjAOj3MTnuTW8SIxbQvLdQCFGKa9e2bWiZ9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SkPAELY2FSE2XiAYOefAgjg943LqW5c321KnTx+VHAbMKEL+e6fK9LoHWB/2f0xtshApzkN6z25HH2eIc5PtbCROvJs7R/silgZQe3cFPWhRrbDk7tC+r7/yH/7xl6oBbjO1TPeBmpXzWfsEpNBSfyZpZ7aOhxDrOnr+8ljiNdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK0QoT9R; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK0QoT9R"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so9317689a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 10:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655098; x=1785259898; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nsqek6AjAOj3MTnuTW8SIxbQvLdQCFGKa9e2bWiZ9Y=;
        b=XK0QoT9RpL6AVRBIe9BLfxWv1wD4e8N1viYMyUIyKU49xt0ClrFmJeuFcs0iyr35vA
         QeTExrXQeS1gnh0+91FxuxWPsU9A7XLKXEBPtXv9FWqcQi5bvfiYFUwRMlzOl1n23ASx
         Y0VRuQF6Ta0Z9fax6N0moUd4pDoHiLbh6tCG7SJ5SE3gyID5nI/y1TRdpm6Prt29UNN1
         wJAyxmw+IM5PttXiginZ6XoY3i7p6bwBWU0vV+XuyU9oomJcV2rbYgJAXtZaFkSiRx+X
         IVvD8/MCjoAYFVZ7hojgavf5vnSr1KGVVrl0fRRoVo4YM2KKvZ0gSFO4Blje5x6GEofx
         wytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655098; x=1785259898;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nsqek6AjAOj3MTnuTW8SIxbQvLdQCFGKa9e2bWiZ9Y=;
        b=ST3lFwHnjSDyDy0X4lOAoTDmrHCtFy1dzgGUP9hIDAzTHcOtifKMRLAadcC7vMwjmk
         oR49pUQmg0crYTv0m38KmrraNyH7BBDQEoEq7otKmi5dV/A8kaa6aILOLc8IAkfJlSFs
         Z4zLVygCpokT4SBr35wKO/emu/oIv2EzGj2rflOcuQ8EqGwZuvScS+UUnQOnDgxZq/tY
         GN8DwIm3HiphGQygCgue4yL7zWUkFZ+9akBSATi4iELf414cYQfw6Gh3dI2BvURxL6ok
         EnCDZjc1sMHrXq0FKlsDznltJhxxup7hNKXNzn2kLeDrsh7OIz+i9GFp/MLIGHPHwhNr
         oZag==
X-Forwarded-Encrypted: i=1; AHgh+RrnoPuDDlafZtr3tSvnKbKL/lvx6GFsz32f3EkkFWvuxrUET37ZJFe9EbRWHRjnxZD30l+ZPklPF5y/dgUWOEvTIZpv@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyXi8aHrd7KUHef///UWKnH1SRBBDatrcGjNL3OAGZwjXaPHe
	rwxRjVCE2eUM6XM7DZ3wzJ7pFlO66PJt/nq36OOgMrwB59rGfQGWs2uC
X-Gm-Gg: AR+sD12t/XaiyN2b/cu4CCO3Pf29bjae6EpFicO61E5tHx9w/aMjVsRIp6LBM0+c5cw
	Xt56cIKKa6Rv+FmF6Q7NmB+BxsJG+ceeREfHwAPiV5BF4mc2v6knjOI49NjTJzrF7fXSIm6oe41
	YglQHUQREW7hHkvFaeHFKm0nhP+V/gv7p3LC4ZQ2wsvRsFDbM5tqIO+EWLOdNJ+3xqNFOUimou/
	4rSz53g149YJyDV0zJzVuHlPONcKg7iJOzAX2D/s2H0RvOOHl7E9rvyWbb6mqERFvj5JwRysM8R
	WkqG6xZGf8OEpWu2j9/LB4ktFlCT7Bcgcl6LNKkBtmITiiPdI0CXWZg3IL4LczixT3egbtKjay+
	zjU37fXeQpUlaFDHHjtersggTXzhY+yYld+GStWXGzMv9iLm42U6U6PoFFRB2OW8ATHIx1DFQXI
	tPpJrp9Q==
X-Received: by 2002:a17:90b:520d:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-38e4b56e98cmr21154180a91.22.1784655098371;
        Tue, 21 Jul 2026 10:31:38 -0700 (PDT)
Received: from [127.0.1.1] ([212.241.15.196])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-13ce2a129f3sm39336364c88.7.2026.07.21.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:31:38 -0700 (PDT)
From: Musaev Ibragim <atomicus.xyz@gmail.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Gladyshev Ilya <foxido@foxido.dev>, Hans de Goede <hansg@kernel.org>,
 Mingyou Chen <qby140326@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: redmi-wmi: report EC state change events
Date: Tue, 21 Jul 2026 23:31:25 +0600
Message-ID: <178465508554.4674.15793036730807770065@gmail.com>
In-Reply-To: <0dccec1c-d0f2-f043-3176-728c53791f3d@linux.intel.com>
References: <178405473606.25865.4048095379503614221@gmail.com>
 <0dccec1c-d0f2-f043-3176-728c53791f3d@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 21 Jul 2026, Ilpo Järvinen wrote:

> Like you've now noticed (I think), there's another series attempting to
> fix the GUID problem.
>
> I'd primarily prefer taking the GUID problem fixing series (but it
> should make sure this too is addressed).
>
> If the GUID problem series not finished in this cycle, I can consider this
> patch instead towards the end of the cycle.
>
> Is that fine with you?

Yes, that's fine with me -- landing the GUID-fix series first makes
sense. I've already reviewed the Redmibook side of it on my TM2209 and
left comments on patch 2/4, including a request to keep these EC state
events observable rather than KE_IGNOREd. Happy to test v2 on this
hardware.

If the series misses the cycle, picking this patch up at the end of it
works for me.

Thanks,
Ibragim
