Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222282;
	b=PGUwTNPLPLPVzdXU1dSq6r/HQurB/stkhR9Jaze7tzpGZ0mIzg/YO19LUFVHn5+TEDQL
	 9SU+2SuMXzYo5TD8tcCz6sZIxwWRRGe1KicdRfWM/0pUiU4WuTXNv7PMo6Zx27lI89yvs
	 HX/to6ludajFwqUFVUrZ1xkLZ4Jm+uzdVX039SPyMbbQKfQUPo1KvSz79mWDayd7mT6fS
	 7OVwmGoSTEyUtiP4zwc5PZwzrSTySkZD7OaG+5eZ2yvHvUXMdUqh4lhJS05sG6WnIlTc7
	 Zz1RXS0PV/kalvw/31sTAj8JnC92GQ2Mc9bDalqWREjSRzR8EvKp8fwGVqcScCAwjag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222282;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=vY870kw8ac+V2Wuq0fL1wIEtKJAiuF/qk+3277HWEQ8=;
	b=z1XTpa8s+Lgo9tJMciUad1dZz7V8SrfwnOBFkElDvhx074HbwLsuc2SJgEeR8F9yeIQu
	 qiTqWxPZNiNzaDrFr4nyUxldRxqhLi9yTCJfyoCLnnBMuVqWk/f2Siw0/OL7IvrEbJALP
	 qBmfFoTdaHBZBu4W+lkYrrp1H0pUAjk6ZPmXHmlYwUXKiNrUqQwhev1uhpYqUUHGCY8QI
	 c9jUZ3DwN2TtJI7CEnuu69uV4TSFYx0rs78f3Agy7DTZygdMeixYnzf/Bo2Qnx63/M0SQ
	 zbyon0sM/lrWFoW6NjyYjt/Ozy9Z00fbeNz2P2SfKInUglOx1t78bimZD+j6KqLITFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYfR2e1b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3E606A6B1;
	Sat, 21 Nov 2026 00:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYfR2e1b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691981F000C6;
	Sat, 21 Nov 2026 00:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222280;
	bh=vY870kw8ac+V2Wuq0fL1wIEtKJAiuF/qk+3277HWEQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PYfR2e1b5TYz8yA4iUSeCORk0MGfcGRYfFFLBfISXEGgu/k6qbxfRUbSwZSgk6yU1
	 Bqbg7clCILbcezOmlMk3IdNTCJA2R36c/c5ZC48Av9BSSnTIOUg9u37+V6COGs6f1o
	 ityP1SoHn7wGcrqY8mBLijA7aUFbriL5FB2ZFTxSYTxcKCRuglQ5l9iptmuinJLiu9
	 10YG2gmsaFPlw6bzKJKxLOAIHwwrQlT9M5967AVd82764aZ9nIK7+l5hgKkNzVbPqn
	 j4h4GXephOP0X+FGZ0SNnhS6Vnw1Qqhw5rgLjOxs9odpeS91rcra7E8Y3WMc+T3bDU
	 KT/e93C4xaahQ==
Received: by pali.im (Postfix)
	id BEC004A0; Sat, 21 Nov 2026 01:51:17 +0100 (CET)
Date: Sat, 21 Nov 2026 01:51:17 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Brian Mak <bmak@nvidia.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Message-ID: <20261121005117.k7kozibkdqfo2aty@pali>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
 <20261121003835.uemb2uaqm6enjqrq@pali>
 <bba7e3b3-65fc-43dd-a9f0-b092c2cc0a32@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bba7e3b3-65fc-43dd-a9f0-b092c2cc0a32@nvidia.com>
User-Agent: NeoMutt/20180716

On Saturday 21 November 2026 00:45:05 Brian Mak wrote:
> On 11/20/26 16:38, Pali Rohár wrote:
> > On Friday 20 November 2026 16:05:52 Brian Mak wrote:
> >> On Dell RTX Spark laptops, the SMBIOS calling interface completes every
> >> request with an all-zero buffer, even for requests that should fail.
> >> Drivers that rely on it, such as dell-laptop and dell-pc, end up
> >> reporting bogus state, like battery charge modes and thermal modes.
> > 
> > Hello, is Dell aware of this firmware issue? And it is going to be fixed?
> 
> I will be reporting this to Dell and will update back when I hear back.
> 
> Thanks,
> Brian

Perfect, thank you! It is important to report any such issue because lot
of times hardware / firmware developers do not know about such issues
which linux driver development uncover. This also helps with maintenance
of linux drivers, because there is a chance that new models would have
bugs fixed and the list of affected machines in driver would not grow up.
