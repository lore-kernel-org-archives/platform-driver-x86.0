Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E5373760;
	Wed, 19 Nov 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567192; cv=none; b=ZEF5Rdx81tED9SZ3YWy8pTUdmK4PysS1QnV67i2/1c7/CHu5ypuQfTJ2vKwqGwhaQGUeUh8XXxTl7p5sFK8Xmj5VTGKned7p+VQtoJdEdwirYipDQfSej4CFO9xvh6KCl8qRpgdQh5tQ+aCvurQlBjFF5f0QIDYrBhsnbchLOa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567192; c=relaxed/simple;
	bh=2ofpBqxmAKGi/jBA6l2UrdSjvIOA7/q+DzTUle55i+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa/rXHl1kSuWtF9WHRQb9QKhPkRww5WSMLaU5fDVVh0n9/P/LiFY5Nk6ZVMN9u+sOFUFvq496aItLiGytzE9rmtQfKgIba5uKDjMfa+B5sFBbgEODUCeWNGUM8tGj+2Rx0Ni1oIQPGgz2X/VY+hih46J45ousJSAdmJndAreg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH26lKaW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH26lKaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E01C116C6;
	Wed, 19 Nov 2025 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763567192;
	bh=2ofpBqxmAKGi/jBA6l2UrdSjvIOA7/q+DzTUle55i+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pH26lKaWRvX6GgFLZXY1TV6tPHrkB0OQf2//fMMnfmkLn2Fm0MeVUiQHw1ONxQiIF
	 /HfBqps1TsKgIg/IhRspEB+bK4kAwf0i7aOQgTXp2PRmdD6NJmaIhO1W6XCchd0AYI
	 nFGuhyFC6w5my3t+GL77gUWL2vOejYODLYlDRHiaCrcNy81LyxmhXMvfLfJRYLbboJ
	 4NQ34jmEZH/Ahv6HhSmP1wc8sLRZGQlZ2X4mtvY41bPez395ETD80MqzYKb3eNmIf4
	 iiOa0eNSX8UbTVwfO0xJZliPkOiftOW/8tIzyjK/iPI+ZPWpJmp8EIPbz3hqujIU+W
	 NfCcrhmmRlUcw==
Date: Wed, 19 Nov 2025 16:46:28 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
Message-ID: <aR3mVNQ6fT3apFnO@localhost.localdomain>
References: <20251107143837.247085-1-marco.crivellari@suse.com>
 <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com>
 <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
 <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
 <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com>
 <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com>
 <CAAofZF7GwRKQcNAUK9=j4mqnz+HX_ONG9YKs4PLztbjvJxrxZg@mail.gmail.com>
 <324dfca8-8f16-158c-8fb9-8efb52eff4ac@linux.intel.com>
 <CAAofZF7AbQ12-3DzpN9Ai49VzOHa3VqyfZnXSpfVq7qijO1GRQ@mail.gmail.com>
 <45ac7298-6053-b125-69b3-3ef198315fe8@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45ac7298-6053-b125-69b3-3ef198315fe8@linux.intel.com>

Le Wed, Nov 19, 2025 at 04:44:32PM +0200, Ilpo Järvinen a écrit :
> On Wed, 19 Nov 2025, Marco Crivellari wrote:
> 
> > Hi,
> > On Wed, Nov 19, 2025 at 12:12 PM Ilpo Järvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >[...]
> > >
> > > For those system_wq changes you can follow a similar structure but alter
> > > it to match what is changed in the other interface.
> > >
> > > This seems already okay:
> > >
> > > "Replace system_wq with system_percpu_wq, keeping the same behavior."
> > 
> > Sorry it's just to check with you before sending a useless series.
> > Sounds good this, for the 2 system_percpu_wq commit logs?
> > I don't think there is more to add here, because it is a wq rename.
> > 
> > 
> > This patch continues the effort to refactor worqueue APIs, which has begun
> 
> Please fix that typo.
> 
> > with the change introducing new workqueues and a new alloc_workqueue flag:
> > 
> > commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> > commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> You should still have here the paragraph which explains the default change 
> briefly, similar to what was with the WQ_PERCPU description. I suggest you 
> just edit the wording in the paragraph taken from WQ_PERCPU changelog we 
> agreed on at the places where functions and arguments are different.

Thanks Ilpo for your changelogs change suggestions!

How does the following look like?

"""
platform: x86: Replace use of system_wq with system_percpu_wq

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> systemd_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.
"""

-- 
Frederic Weisbecker
SUSE Labs
