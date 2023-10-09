Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B05E95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 11:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346266AbjJILjf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346230AbjJILjf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 07:39:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104559E
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696851574; x=1728387574;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WkSKNdzWrdstQ/maVAhO8GxxrCQZ9R79ykpJUOnwFDw=;
  b=mmRXwDoASWMpcPLapM+2FrA55pDyuqx0NXOx+TDIFmit6IVorzIVabCZ
   rNP9tgt7TGeCfubcdLeVmn5W3A2q/bmFwwzqCkGI6dleuVpB29apWtK8c
   7URdnsRqcXCy/K6WbeRHxHNPniRoB/FNxpFniRia+s+C2NHgper5+6w/x
   VPAeXWlmrEMOteEtzclV6J5NZ5ClHfyrTo3+tniRpstZbLjQUgwfOopku
   XYGRQkj7QUyeCpP0BW9irAmzCVkDnlMQ1XeS8f2+FWdr9wdV6idfiAX1A
   iogGLzl7xB12qU2wkrIaJVx5zkIwVjWkPlTtkBtKEps6IDc0XYtIZf+rV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="386966441"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="386966441"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1000174588"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="1000174588"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:39:30 -0700
Date:   Mon, 9 Oct 2023 14:39:28 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH v2 2/3] platform/x86: msi-ec: rename fn_super_swap
In-Reply-To: <20231006175352.1753017-7-teackot@gmail.com>
Message-ID: <c70f59e-5a8c-ae8e-21d7-dc99662e85e1@linux.intel.com>
References: <20231006175352.1753017-3-teackot@gmail.com> <20231006175352.1753017-7-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 6 Oct 2023, Nikita Kravets wrote:

> This patch renames fn_super_swap to fn_win_swap for consistency
> with the downstream version of the driver. Renaming the field to
> fn_super_swap in the downstream driver would require modifying several
> branches that are yet to be merged into the main branch, so I decided
> to do it here instead.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>

Applied this particular patch (2/3) to my local review-ilpo branch.

Hans will take care of applying the fix in 1/3.


-- 
 i.

