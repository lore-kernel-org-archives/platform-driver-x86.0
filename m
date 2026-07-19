Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C2318B0F;
	Sun, 19 Jul 2026 02:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784426458; cv=none; b=GlAQxbF5U8atgdB1Jerj2TTN57pPAmjhk3pTLkSIwBv+phEhyKRx8sgZPVaOaIw990sLMkIQbapaqtOutmcbQyr1JJNhNV+l3qc3wzyUK+Qz8UJtEFTayFq3Ia9LZQI0my9fGWss5TSK6T5txpaLqExnvTVPVJriMQLoexlXByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784426458; c=relaxed/simple;
	bh=+cgMAv4pJyqbln0Y/efgT40IJmrPzO3cjpskLGagsFo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sXlMaEUuSsIxCRiz5+E8Kf+KAoxgEb0hfc65MIe3llbxPdP6d6XIT3kQpC24pUh/pphsFT+/kBvR6wn1K7BOmnhViixjDUXeT9juupbvFFlWMke4A1HqXti8x9RxdPxRbfKoz5exJW6yv2AXjxOHoadqFEw3tO64mNScvLpeP6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=OecwdOX9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ie9riLAf; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="OecwdOX9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ie9riLAf"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id EC0D81D0006B;
	Sat, 18 Jul 2026 22:00:54 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 18 Jul 2026 22:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1784426454;
	 x=1784512854; bh=PwCc6i1bdvaCErer9U+IdqXPKfIw2O2VAvEWFgbGNJo=; b=
	OecwdOX9UarT0sFGwTsVuYtjhjg7A/dJvv9ZZkJPkTaEFM7ALrfXVmhijtAtdmVY
	2RR1vrJLPRQxPcOC8ltcAyLeZ0J2CGKYmrE65DTEdfwsNgGH1TaAcZTbZq728I61
	GulgY+6U+kRSUzaSlX8C9Tk7nPy9cgNXtzWOfbG7WvfYTOdUHo/eUAJhCLyKHtvA
	iAZl/Pjiz8Bw0aQ9wxx7e/x+4kM6Xl/SniYVssRfpPLgHBhlmMnaqTUAdYgLPqwD
	4Mgm2HrqwIhNf1quALwPmBJ+HrbLO0GHuteMWfr+ozpxqJMoZ6LVUkDHiDIlbK4C
	g/R1/QegoVt1NfyZAHOgEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784426454; x=
	1784512854; bh=PwCc6i1bdvaCErer9U+IdqXPKfIw2O2VAvEWFgbGNJo=; b=I
	e9riLAficzcpsZR8UTxMOH8N3tr13iV7XbmNWt/6cOysPeYZeJ1KEnLZVz6sxsOR
	G9VccuAxlSnOKkI0pRquqBbDRMX1UKc3xWoby5F+7AU2vGhnDsAYaEdDwZ0y/15x
	k3BcxHDIuZ2j8+JfGDk8UnUzyg/TLN5A2e8Qh+WVlG5GpC9zYD6rAK1mj52qTlGM
	p+GJZocrhWdq+m+i4et+dviouvLCLfX7BU0Nz9/VdpEY0dwB7j0wLpRzlJWE/x8z
	mgn4K0XYewZYsYQFS1zluP8lz91oZIwxPpZytqhWe79Oj9jQN2+SolwqA2t/wTVR
	SGFyWFAo6bqOwxJdR0Lxw==
X-ME-Sender: <xms:1i9cajvfTFUZjZ_AR6kAcXh7gzJ_rvOFubvhx3rZaJSvRWMAH50QfQ>
    <xme:1i9cavThPDLP6LO1IC47tiLp7WRR9ixS-GxBBPDxRgJlbn8sf3H9odXxHgb3RBrtw
    PfVcc2PRzTYPtrIAlwubmCQSRZX7T2RWE_oH8iAgqh8hTLkQggu4cU>
X-ME-Proxy-Cause: dmFkZTG0vqR8McJKPCl0CA1MVajPKZrNDkWDx/u/kAlZr/YgQ6lGJdXkT/PcKKrMSHRJmf
    BnqWYLAfc1sWSOcXCk81eRJ4ImxwDygIYGewD0YrCQqhMQABpZuY4hd86eI70IGqfsVFNr
    yI8yPQbcqLpIayl/9VkmbfybP8/2sShfV9h1BHOTYVhSc6Vevw9Kqy0qVdb+o9YSFdu1RQ
    y204lUYzIMXAM7aUkccfp72gxyVwPqgl4RaXjBkGsWY0bKFefZQXX04VIRSPyNbozjVfj5
    LETaW34cJGVSrhExiHes3AF7ZlH4RNELifoCBCBfq/sIW8stawhlqE2CUSw1owQ4aSZGZq
    YNAmOPifesBetdKgV2egAbPU5O7yar7aWPIM0CmddmmLTZxpZ2j3NU5CnDRpDx+HAteWNm
    EfYWnjKlzpzYn04xCQi6vDjoYEtvanIpjAvJBMco4P3fYGbTwBqQ561iXHGAmvemYA9NhW
    3EU02mT+wqWxjTv9wbQRfZxtE0Ws2gYCCo40JZhrWSd/IIWbq759b/kPX0XzYgGYEfpej6
    rPvtSPz/G8oPMeYCRim3UX1SFiJn8pAaTe0G5mao51vZzX9SZJ7DTXcRmWZYisF4BxzyYT
    5erXpG4mvglNXyABx7gMmpDLKnaLvfrmemdM7Ts18x4n4Y9338w64cgCy6cw
X-ME-Proxy: <xmx:1i9canvS9YnduKkJSo5kzOy_-NBQx_k2YF421s0LbToWRrZyORfu5w>
    <xmx:1i9calAH9cP2iRF5JFkmnxPVFMqV2YsUUfZO0dZGgj4YK0YdJ5CZ-Q>
    <xmx:1i9cavM1TCU449XgLgPZLf9PhcGgvgZ_Ls1qacc6AiktdQICjUaHzQ>
    <xmx:1i9catBLZAChd_xq7yPI2GgrkmJHBxpeRZGacagXV6tNS5fDDxAPBw>
    <xmx:1i9caploQAhVqZAf1BgLU_C9SuP0tymoA-0daqTV_EnupXG-dXoBEFdG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 453062CE03C0; Sat, 18 Jul 2026 22:00:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A2E4tekp3ChN
Date: Sat, 18 Jul 2026 22:00:34 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Yahya Toubali" <yahya@yahyatoubali.me>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "Weijie Yuan" <wy@wyuan.org>
Message-Id: <b078b8d4-a15d-410b-ae74-39d09d39762d@app.fastmail.com>
In-Reply-To: <20260718165616.1923610-1-yahya@yahyatoubali.me>
References: <alukuB0r73qfc1PG@wyuan.org>
 <20260718165616.1923610-1-yahya@yahyatoubali.me>
Subject: Re: [PATCH v3] Documentation: fix spelling typos
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Jul 18, 2026, at 12:56 PM, Yahya Toubali wrote:
> Fix 'Minumum' -> 'Minimum' in lenovo-wmi-other.rst and
> 'maintainance' -> 'maintenance' in housekeeping.rst.
> These were flagged by checkpatch.
>
> Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
> ---
>  Documentation/core-api/housekeeping.rst        | 2 +-
>  Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/core-api/housekeeping.rst 
> b/Documentation/core-api/housekeeping.rst
> index ccb0a88b9cb3..71ba5d86f249 100644
> --- a/Documentation/core-api/housekeeping.rst
> +++ b/Documentation/core-api/housekeeping.rst
> @@ -9,7 +9,7 @@ extreme workloads can't stand, such as in some DPDK 
> usecases.
> 
>  The kernel work moved away by CPU isolation is commonly described as
>  "housekeeping" because it includes ground work that performs cleanups,
> -statistics maintainance and actions relying on them, memory release,
> +statistics maintenance and actions relying on them, memory release,
>  various deferrals etc...
> 
>  Sometimes housekeeping is just some unbound work (unbound workqueues,
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst 
> b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 011054d64eac..65cb78ef285a 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -163,5 +163,5 @@ data using the `bmfdec 
> <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
>      [WmiDataId(2), read, Description("Fan ID."), 
> WmiSizeIs("NumOfFans")] uint32 FanId[];
>      [WmiDataId(3), read, Description("Maximum Fan Speed."), 
> WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
> -    [WmiDataId(4), read, Description("Minumum Fan Speed."), 
> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
> +    [WmiDataId(4), read, Description("Minimum Fan Speed."), 
> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>    };

The minumum fix has been proposed a few times already. It's a miss-spell that comes from the BIOS, so is deliberately wrong.

That being said - I vote we correct it so that we stop getting patches that want to fix it.
In the interests of not seeing it again:

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
