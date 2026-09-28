Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE714F55C3;
	Mon, 28 Sep 2026 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614412; cv=none; b=ZU+KU2EtnajgGz4Ll1ZUUcagWOv/wc+9eKto624wY+pV8QJTKcCUi/KpIWNKhDFuN/0OoSlKQcUaK6VshU6nla7+/OnJ4i6QvwpS+N5Gm+iynMrz+r9iTHs+YGDdKf3ABZh5mDMHlKbl7PNUQLPCplEfd0b8bgq90+C9uo7b4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614412; c=relaxed/simple;
	bh=TYruS+4jY7k55W3pbREPvxHeXgv58IoktXvhxcw1IdI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=emM0lCbuzOZRo93C1Ukpq2ol9pSb9/0hO89BqLk7wjGeaJ2IrWsLMmof88MHaNmzGJhVupxdffU51FPVpxkXyHKGQuQwr5qbVP8WrYTIkv6RjAiEu5HyVmfAz4YdPwWTxYAjwHBqUE3AeuzYBh0ZiuvU4oD7L5wTFkLQqLHWVX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=T8Frj5Dd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ir5vgT5Q; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="T8Frj5Dd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ir5vgT5Q"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id A6CF3EC0120;
	Mon, 28 Sep 2026 12:53:29 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 12:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790614409;
	 x=1790700809; bh=AoZsCEexovk1833YCq3s/BTq7sBK/ZcDfLYYlsvRmG0=; b=
	T8Frj5DdMTchmibnp7zcC/lrlK9pu7etKU7VBa1uP3AoJNNL2fGjXZsQuxaV6oOw
	eGlMzT3kuOgCatkvqCk5CwD4HLh9D0JUJYjxW+T1u/rwX0+8fbaUD8j20zGjfHnv
	pZGae9Sxk3884NJ5vxIC6ELWrtCYX26ELlyQj3znuKFzMYhbpwsXFcwUXgG7s+Ys
	Vlkh82p9XRt6Wrj6kq+Pcz462oSGf+NvdXZZihr1pRNxCL3z3P665t5HHkUGVHCT
	6sB14EWW+Lz0Vw+PTMuukUM+CaQ7Uy2DI57FDTQhfH8v4GcDTrBQ+8Lgx+XmyufZ
	8YwnNkzTh76HbTmlzFqTjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790614409; x=
	1790700809; bh=AoZsCEexovk1833YCq3s/BTq7sBK/ZcDfLYYlsvRmG0=; b=i
	r5vgT5Qpuq66xFMX0DEnbi1vbBHcYWpt7yLlxj4AY3Pz8mGxLi9vD2QquEiB396I
	e7M6JMfSxI9bZZAWer4GVXgOuH47xcvOU90/wwlS3LVr+E8i3UrD5WTg6if8cVea
	G55V8nAsB6lXwvax3FKgkbsUh7rQvE+lQqDW4c5fyRN9CBNri7MduMSk6Tn9iYKB
	dIqbRMWi03xyz82ooGc8FGmmb76ewp0X6frrUOhJO2M03IMIJSvMD5t+Yty5TjDz
	EW+UKJm268ZhpySMAZZ1QVxJWgmgCVc8TNt1Bq2k2j8R3mXCS44i1HbBLmNDorJT
	rEj7n1+yUEZ3v8CkR/hqQ==
X-ME-Sender: <xms:iJu6ahPgwgiGdefrsCNN-5BKI2ZK0riaiI5nuyDmHHwmLQnnoRciuA>
    <xme:iJu6auxNXbde_psGeM4RL8T_rKWTlw5jqeiBEBk78-B5L7RDfkA_Ah1E-HqUz9F-i
    mPP-BnlfI1XeWSqEaGBehuvMIWjy2wS2lQG4p_4r2D5Ww5s_hx7x2Gx>
X-ME-Proxy-Cause: dmFkZTF9q61CvZx/ta7AAe+OhXpllSoOiE2CbN9DN2Njw7fNJgZ93TOObmbUr3jrVpUzh9
    59UARQGAE49ENrGuVXjAec7rVvMTqOIoRsfvVUWpvNH2nIuJAo91dd6XPv+mYbslUBovuL
    NbCXytKx1qMx9ok2C3BiKfyOhSLve4y7AvonXF327Z7WM84eRJkPz5byllBcL7yU5v05ZV
    yc5hBttZvPUtWjVdjYEBRJT8sTxsl2e4Xitzr2/6eQ9gxc9BIvgI9Do9wihq+JyM9TzaLy
    bdjiVdRBeqEZogI+YZyhxwgSP0RlR0ZqVTeSLlp/O3gNsyQzEu/hQZrYwBQ0QUu5iExZoh
    MvDJh1XsraTq7CC92QxVD0VJNDmiR0FSLvqn5a0dTOdHlXQsph9rwxAKrj//UEGHiQf3Ud
    ZAlWz66j+iZ2+1mMEeSnuPTkMfd32YFV8ihika1PQMtFTPgHrx/0MSIoKdnUlCNrmnOh+I
    N9+u5gb5D4AOq7eIcfNubZavcaVCZohhgo+DSEANTp4JN1HwD9CS7tngoxucamAtWYE2Zz
    Fv1MQOiTRrEUk6Br2PNhpktB4/6AMsoRMmJ2nga8vO0gobgLs4qf1eV+fXrSbR2RtRhmSo
    CsE0sx3Gx05sxs3Iho1pA5fQBkwDrWoue69V90q5Kj5k5zeK+WcpkjfB294A
X-ME-Proxy: <xmx:iZu6ajatb0NxDkGyQKMpAHuWAWCABI2OC4FtuJz3nKFcNo2M4vuWVg>
    <xmx:iZu6arWd75GZkj_PArJhJ3jEN02qnasGo7kBfR2IPGKPuKnYFytv4g>
    <xmx:iZu6ahgMzBkV2l_vN6C348AMTOYxm_ZXCrRMiBnOFIGCirAeqTTpfQ>
    <xmx:iZu6apv3TzxW5rG-f0OwFQhoIpw1vQHnGEAI3acTuOtBHMPxhjA3pA>
    <xmx:iZu6auGce4RaakXii1WzXf4kXRl9u-FQPFVybunQwrHS9VSfPIX2akv0>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id D69512C0006F; Mon, 28 Sep 2026 12:53:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AR9QFgTacGdo
Date: Mon, 28 Sep 2026 12:53:08 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Bruno BOI" <bruno.boi@bobtopus.eu>,
 "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <c22fe14e-41c3-425e-9f8e-39b900ab6e3b@app.fastmail.com>
In-Reply-To: <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
References: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
 <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to
 quirk_s2idle_bug
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 28, 2026, at 12:09 PM, Mario Limonciello wrote:
> On 9/28/26 11:06, Bruno BOI wrote:
>> The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
>> s2idle resume stall as the already listed 21C6 variant: resuming from
>> s2idle blocks for several seconds before the kernel resumes.
>> 
>> DMI_MATCH() performs substring matching, so a "21C5" entry also covers
>> SKUs such as 21C5S05800. Add the 21C5 model to the existing
>> quirk_s2idle_bug table.
>> 
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222070
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221273
>> Signed-off-by: Bruno BOI <bruno.boi@bobtopus.eu>
>> ---
>> Changes in v2: resent with the correct sender address; the patch
>> content is unchanged from v1.
>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>
> Mark,
>
> Since it uses prefixes rather than a new entry how would you feel about:
>
> DMI_MATCH(DMI_PRODUCT_NAME, "21C"),
>
> On the 21C6 existing entry.

The last char covers a lot of platforms unfortunately

Ignoring the Intel platforms (I assume this driver wouldn't try and load on those - there are a bunch including a Chromebook if that makes any difference)

T14s Gen 3 AMD, X13 Gen 3 AMD, L14 Gen 3 AMD, L15 Gen 3 AMD, T14 Gen 3 AMD, T16 G1 AMD, P16s Gen 1 AMD, K14 AMD would all be impacted.

I probably have a bunch of these to be able to test - but not all (and definitely not the K14).

Adding 21C5 and 21C6 should cover all L14 G3 AMD models.

Mark
