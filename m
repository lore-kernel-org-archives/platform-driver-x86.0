Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33D3CDB47E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 14:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345789AbjJROcI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 10:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345567AbjJROby (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 10:31:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B4D6E94
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697638736; x=1729174736;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lVrmF/nhKmNW9mNVYYe48YcjbWIWh6WYwO/QGVlffHw=;
  b=f/Tp/5WbfGggcqKQTQfPxIsFPbBn3wVHF3+egqhbSK+KBOjXoJfVjQN1
   wKFjJcvpd3aLY7XvcTXnzrmdFABi/ymXUkGVNK/eHJq/srv0592Rchwnh
   FV3ZPQy8+xeNS0zKjoAo0Dete/dJWIIPVmNhqkiVmPa0jdnNRrmFQ/AOP
   XhmotfTBfLU6R0xZ6Kx/vbF2EzoNJRcW/3ZAbkDB0rg+G7TK/tuKEUs6g
   0BCPfV/J46mAEJGEdqLQVRWJR9wFwkIOEG6hRS4fa/EPlVz4/Cpfn4ivm
   RgkGkzG4altyl5/rLIdsvih3s76llIUZy21UH2hdJkROX1QXtHzj51rMH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7574424"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="7574424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822450169"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="822450169"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:18:27 -0700
Date:   Wed, 18 Oct 2023 17:18:25 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.7-rc1
In-Reply-To: <c5c44896-9460-1e5f-51d1-ef8fca040011@redhat.com>
Message-ID: <e64d9868-34b4-a7ae-dde2-3ea7bdef96b0@linux.intel.com>
References: <8680ce83af5ed5268bb05d87c579a42a1eeb97b4.camel@intel.com> <c5c44896-9460-1e5f-51d1-ef8fca040011@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 18 Oct 2023, Hans de Goede wrote:
> On 10/18/23 00:06, Pandruvada, Srinivas wrote:
> > 
> > Pull request for Intel Speed Select version v1.18.
> 
> Thanks, note I'm co-maintaining the pdx86 subsys with Ilpo
> now the plan is that we alternate merging patches leading up to
> the next merge-window. Ilpo is taking care of merging stuff for
> the 6.7 merge-window. For future intel-speed-select pull-reqs it
> is probably easiest to just send it to the both of us.
> 
> Ilpo, can you take care of merging this ?

It's now merged into review-ilpo, thank you all!

-- 
 i.

> > Summary of changes:
> > - CPU 0 hotplug support is deprecated in the upstream kernel. This
> > causes failures during level change for several customers. So, add a
> > silent workaround to use Cgroup v2, without user option.
> > - Increase number of CPUs in a single request
> > - Fix turbo mode enable/disable issue
> > - Error handling for invalid input options
> > 
> > The base branch for these changes
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> > branch: review-hans
> > 
> > 
> > The following changes since commit
> > 6cb9c8637c672584d4915559001020237840acba:
> > 
> >   platform/x86: think-lmi: Use strreplace() to replace a character by
> > nul (2023-09-21 18:31:19 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/spandruvada/linux-kernel.git intel-sst
> > 
> > for you to fetch changes up to
> > a590ed62269a049a72484ce617fe2f34e2da66cf:
> > 
> >   tools/power/x86/intel-speed-select: v1.18 release (2023-10-17
> > 14:54:44 -0700)
> > 
> > ----------------------------------------------------------------
> > Srinivas Pandruvada (8):
> >       tools/power/x86/intel-speed-select: Sanitize integer arguments
> >       tools/power/x86/intel-speed-select: Update help for TRL
> >       tools/power/x86/intel-speed-select: turbo-mode enable disable
> > swapped
> >       tools/power/x86/intel-speed-select: No TRL for non compute
> > domains
> >       tools/power/x86/intel-speed-select: Display error for core-power
> > support
> >       tools/power/x86/intel-speed-select: Increase max CPUs in one
> > request
> >       tools/power/x86/intel-speed-select: Use cgroup isolate for CPU 0
> >       tools/power/x86/intel-speed-select: v1.18 release
> > 
> >  tools/power/x86/intel-speed-select/isst-config.c | 213
> > ++++++++++++++++++++++++++++++++++----------
> >  tools/power/x86/intel-speed-select/isst-daemon.c |   3 +-
> >  tools/power/x86/intel-speed-select/isst.h        |   3 +-
> >  3 files changed, 168 insertions(+), 51 deletions(-)
> > 
> > Thanks,
> > Srinivas
> 

