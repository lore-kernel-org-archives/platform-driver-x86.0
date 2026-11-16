Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794848656;
	b=g9JjtKAZH+RTff6T3vNxdJWuSAavDzRbZGJt1Z03sbRjfKORXlPxR5rSH17mZjA0LhMz
	 Ee9limsLqcWoY5drEjY39ZgqJcl2IsxxwmS79CpZfpqH9rNDO+Uds1JKAqrzTDi/t2V4J
	 ln9DTTAOZbLMmA1UwPIJFV+q74LKVTlWr4D+1p7+igVeS5cXBvVnx1RbyQVjG3mZdSeFk
	 yGZBA5CIuMZMe5YL9jSCZAUXLKeomvtqBRf/gNfdklIyNxQwFU+keEQf502vsWVc3PMyK
	 DBGhz8zPnll1NDBxT4ee2JgKFGzVJCKy1D4xGWvf4+rwoBunj/g9ekqU0GNeycthN8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848656;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=9+FgtBZ/fgAtXmF/vc2cwUtP4DVh+tbC2GegKg8i34Y=;
	b=zZdL7iB5qrg1wZtQe9RGwr07Sv6mYmla8uomuMmH8XBRCWO+0hxwISFPi9Blb8U13YU9
	 oRFfVWFqOX51fPqfPY3K0ICVAB8EVsbsKdJMrfFH95VCBYhTjUEO/0ELCohLC7VHKtS56
	 lMw38Wlw+nt4yG89fv1Uum2f9jQMxotgCfT5NNufzGEy9W3l6tqTn5ouMTJ9BibGWJwfW
	 QUdwijnxf48ChDVCRGQns0t3fUuYdRDo4sU+Tbf2+JDZmnvi3wYAmzK7jtu+iuQbM968s
	 FohwUrepWGvamxtt1vOCd4xjW9O5l1sIQNyH3Vp4TpdFPfLIQkOKMssishqhX3vT7nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=TQ+2x7zA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89B606A323;
	Mon, 16 Nov 2026 17:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF89B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=TQ+2x7zA
ARC-Seal: i=1; a=rsa-sha256; t=1794848639; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mugcjsulB+R4/ah2QRtVL1rTC6jjgEM0e9LTvMa/+4Bkp0nWw9DHKf9qe7AMd2MxSHjtrhbiBOmoLh5Uk3+27t/qM9BIL9nqhaW2j4aPMcaTB8SpnuAa7od8bXDRLrXcd0WczutN8uToqNQ3bs9duEd7h9KqMYUcNpfSgHUmBv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794848639; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9+FgtBZ/fgAtXmF/vc2cwUtP4DVh+tbC2GegKg8i34Y=; 
	b=IXEHlVwwhW7Xtbw34f6dMoPuj9Er4YMg1JPuqAyCZD38dSTqXPhcXRLpakI0qBDEJmk3J9TawNWyoEjpDgBOGTLR50SJCamDG1s4/ctgJlSfIylk0QVZLhe/ZqXFqTS/dg1uYpOv6xeOHffmDUJY3gNzD3uP+t3ohap1R0T/pck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=TQ+2x7zAAnK1j7iNcPwSWsCJDpAuhIkJJ7HLVVcXHVMFELLbRK5iWG7aiY0G7SJgQ/roAXyjQe1m0qwehbaTbs4XZXWhfvIuzKQS2162dhFRCMK55JiDBQQNGiijiGhwAj6NqoYwBqtZhQR4aj7HNNUc8mZUEYnr/7ComhAO1sZ1BDFv7Zf1Lypsa8AhF+EaXfv6pwnpbW3YPerzOlDgHNBK6L3x9oXD47FlhGKMWqe65YUuhEBeWCbCFHt6UhHbYhEJu3vlruRz9kWZ/4PM2LEyd98aEgY1yYHAa4zUPQfx6MkUNrlpflFAwzkCpk1KO4kAIFxFolptZwxvopgiug==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=9+FgtBZ/fgAtXmF/vc2cwUtP4DVh+tbC2GegKg8i34Y=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794848636443780.4537740716285;
	Mon, 16 Nov 2026 09:03:56 -0800 (PST)
Message-ID: <fd3c041e94347571dcbaadbadcc1c27530f53286.camel@rong.moe>
Subject: Re: [PATCH v2 0/2] extcon: synchronize all-connector removal and
 fix Lenovo fastcharger teardown
From: Rong Zhang <i@rong.moe>
To: Hongyan Xu <getshell@seu.edu.cn>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: Zehao Gao <gaozehao@iie.ac.cn>, Hyunjung <hj351016@gmail.com>, MyungJoo
 Ham	 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 "Derek J.Clark" <derekjohn.clark@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <179483944681.43652.9539572356847924730@seu.edu.cn>
References: <179474326098.103840.15531040789536968458@seu.edu.cn>
	 <179483944681.43652.9539572356847924730@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 00:58:50 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Hongyan,

On Mon, 2026-11-16 at 22:30 +0800, Hongyan Xu wrote:
> Hi Rong, Ilpo,
>=20
> Thanks for the review, and sorry for the mess. Let me answer the question=
s, and also put one thing on the record about where the extcon part came fr=
om, because the timeline matters here.
>=20
> v1 link: https://msgid.link/20260806060526.1189-1-getshell@seu.edu.cn
>=20
> That is the patch I posted on 2026-08-06. I should have put it in the cov=
er letter - my mistake.
>=20
> Why the extcon patch exists at all, and why it is in this series:
>=20
> v1 only cancelled the work inside the lenovo driver (devm_work_autocancel=
). After sending it I went back over the teardown path and realized the pat=
ch itself was not correct: cancelling the work is not enough, because the a=
ll-connector raw notifier in extcon can still be running a callback after t=
he consumer unregistered, and that callback can publish the work again. So =
the root cause sits in extcon's notifier handling, and that is what 1/2 fix=
es. That is also why 2/2 says it depends on the preceding synchronization p=
atch.

I haven't look into the issue seriously, but I have an intuition that no
one can reschedule fc->work after devm unregistering fc->nb. Could you
elaborate why PATCH 2 depends on PATCH 1?

Even if it does, using disable_work_sync() should make PATCH 2
independent anyway.

Even if it's dependent, the two patches can still be applied separately
in any order from my perspective. Applying either one alone is a gain,
and it becomes a complete fix when both are applied.

>=20
> On the origin of the idea - I understand the suspicion, so here are the d=
ates:
>=20
> My v1 is from 2026-08-06 (link above).=C2=A0It is also the patchset refer=
enced by the Closes: link Ilpo posted in the 1/2 thread.
>=20
> sashiko reviewed that patchset back then and raised exactly this "extcon =
uses raw notifiers, the synchronization is insufficient" concern. I never r=
eceived that report in my mailbox; I first learned about it from Ilpo's rep=
ly on 2026-11-09:
> https://lore.kernel.org/all/2ef4ad43-497f-c40f-b18a-f5b75799d95d@linux.in=
tel.com/
> That is why 1/2 carries a Link: to that message.
>=20
> Hyunjung's patch is from 2026-11-16:
> https://msgid.link/20261116122001.3096223-1-hj351016@gmail.com
> i.e. three months later.
>=20
> So this did not come from Hyunjung's patch; if anything the order is the =
other way round.=C2=A0
>=20

That's why you should've provide enough background information when
revisioning.

> I am not trying to win an argument - I just do not want the record to say=
 I took someone else's work.
>=20
> The attribution Ilpo suggested is right, and I will use it:
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260806060526.1189-1-getshell%40s=
eu.edu.cn
>=20
> On the other points - all fair, all my fault:
>=20
> S-o-b order: fixed. Zehao Gao co-audited this series with me,=C2=A0
>=20

Then it'd be better to state that in the commit message.

> so his Signed-off-by comes first and mine (the submitter) last:
>=20
> Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
>=20
> The mangled "Jarvinen": my git-send-email setup on Windows encoded the Cc=
 display names as GBK instead of UTF-8. Fixed now (i18n.commitEncoding=3Dut=
f-8, sendemail encoding, UTF-8 console),
>=20

IMHO simply using GNU/Linux helps you get rid of the trouble. Anything
other than UTF-8 is dead de facto, but apparently Windows has its own
thoughts on messing up users. But maybe your college's mailbox has its
own thoughts, too...

>  and I checked the headers of a test message before posting. Sorry for th=
e noise, and thanks for fixing my Cc line.
>=20
> On Ilpo's point that the extcon fix is not pdx86 material - agreed. I wil=
l take 1/2 out of this series; if the extcon change is still wanted, I will=
 repost it to the extcon list on its own with the attribution above. And si=
nce Hyunjung is already working on this, I am happy to let her series go fi=
rst - if her approach covers it, mine can be dropped entirely.

As for Lenovo part, I slightly prefer Hyunjung's, which provided more
context and elaboration, though it seemed that they are also flooding
LKML using LLM agent... What a wonderful era!

>=20
> Although I do not have the hardware, the change has been build-tested and=
 manually audited. The analysis and the patch text were produced with LLM a=
ssistance, then reviewed and edited by me.

Usually I don't complain about the use of LLM as long as the code/text
quality is good (that was why I didn't complain that in Hyunjung's
thread), though my carbon-based stomach always feels uncomfortable when
eating tokens...

But may be you could be more honest here - your reply was also LLM-
assisted, wasn't it? Admitting the use of LLM is not shameful.

Thanks,
Rong

>=20
> Thanks,
> Hongyan
