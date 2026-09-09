Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E01368282
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974310; cv=none; b=AAhsNd7hg1yNvN9RMLqi/dMKe1wk8AOcC0J29DtpDfmfL+BuB7E4nI1xvr/jwvXEfwiAevEsIawbh68/eqYq/lmqKAlg6qVMfN+QdxCSA6qiJiaOGLvy2ex/lco096fntJoWXKs7Kcu5W/cLHyno5veb8R/78Q/7Fs9/njiqac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974310; c=relaxed/simple;
	bh=H1VeEoAcvsOEyN36eN354CP9JC3HLD5TmWF+2n1ZU8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iv2w/knXcXVxixPo2qM9IOPlDzKkkEyNxtS7HU1AnVlmSY1AetyxeEJEsInBbzo5AIgPI8UzK5J3qQd1B2nJbNZFVdiZIK5QPhD2rmHspwnG0KAYwBrvm2RWKdk/WdVk8rM9/by0alqU6ZgBWhMq8NJUU6dbn0LUUCeeIKcUjT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wvfPfqzC; arc=none smtp.client-ip=95.215.58.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wvfPfqzC"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H1VeEoAcvsOEyN36eN354CP9JC3HLD5TmWF+2n1ZU8c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788974304; v=1; x=1789579104;
 b=wvfPfqzCzC9ERYpoRNPtOaMRdZuMB7/RKRx5yyixJ/x5vF7lVZmw85Sn6oa/DRW6nz5uPziT
 EeheJJW0rAKEslaZQ4xXhHEcgaGaefHKI4bLtN5wkez8xaNhHmPw0Yc3tcN29AKub/OnGDYG0K5
 CQlNpUMSFLEboNiM3G7zm7xg=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 76378e880c09277e;
	Wed, 09 Sep 2026 17:18:24 +0000
X-Mizu-Trace-ID: 76378e880c09277e
X-Migadu-Flow: FLOW_OUT
Message-ID: <81e59a58-5691-4959-aa3b-2b9728349ddb@linux.dev>
Date: Wed, 9 Sep 2026 19:18:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dolphin (26.08.0): "Expandable" folders in Details view not
 working when per-folder view properties are enabled
To: =?UTF-8?B?TWFudWVsIEEuIFIuIGRlIE9yw7plIFLDrW9z?= <deor001@gmail.com>,
 linux-kernel@vger.kernel.org, luke@ljones.dev,
 platform-driver-x86@vger.kernel.org
References: <CAOXykpgCPMB7fGGJXD0wdx-0boy3vdRZraFRhegrh7azJiYONA@mail.gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAOXykpgCPMB7fGGJXD0wdx-0boy3vdRZraFRhegrh7azJiYONA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/7/26 03:11, Manuel A. R. de Orúe Ríos wrote:
> Hello, Denis and Luke.
Hello Manuel!
> I was wondering if you could help me communicate about, and get some
> information regarding, the following topic:"
> in Dolphin it's intentional (a design decision) or an oversight that
> hasn't been addressed yet.
>
> Environment:
> - Dolphin 26.08.0
> - Fedora 44, KDE Plasma 6 (Wayland)
>
> Steps to reproduce:
> 1. In Configure Dolphin -> View -> Details tab, enable "Folders: Expandable".
> 2. In Configure Dolphin -> General -> Behavior, enable "Remember
> display style for each folder" (i.e. GlobalViewProps=false).
> 3. Open any folder in Details view.
>
> Observed result:
> The expand arrows for subfolders (the inline tree view) do not appear,
> even though "Expandable" is checked globally.
>
> Expected result:
> The expandable folder tree should work regardless of whether view
> properties are set globally or remembered per folder, since
> "Expandable" is configured as a global Details-view setting and is not
> something exposed as part of the per-folder properties.
>
> This looks related to Bug 524626, which reports a similar coupling
> issue in 26.08.0: the new per-folder zoom feature is tied to
> per-folder view properties (GlobalViewProps=false) with no way to keep
> it independent. My case seems to be the same underlying pattern — a
> setting that should logically be independent from the
> global/per-folder view-properties toggle ends up depending on it.
>
> Could you let me know whether this is expected/by design, or if it's a
> gap that hasn't been considered yet? Happy to provide more details,
> logs, or test further if useful.
Sorry but I don't use said features, and this is the linux kernel mailing list
so... Not the correct place to get answers about this.

You should try KDE's own forum: https://discuss.kde.org/ or the KDE bug
tracker: https://bugs.kde.org/index.cgi
> Regards,
> Manuel de Orúe Ríos.
> ___________________________
Anyway best of luck with solving this issue!

Best regards,
Denis B.
