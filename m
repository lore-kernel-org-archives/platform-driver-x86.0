From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: remove unused code
Date: Thu, 1 Jun 2017 08:11:10 +0200
Message-ID: <20170601061110.qcbjhstxsysbncry@nataraja>
References: <1496272668-25875-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39388 "EHLO
        ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdFAGe0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jun 2017 02:34:26 -0400
Content-Disposition: inline
In-Reply-To: <1496272668-25875-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

On Wed, May 31, 2017 at 04:17:48PM -0700, Alex Hung wrote:
> The struct pcc_keyinput is not used in panasonic-laptop and in
> anywhere in kernel, and it can be removed.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Acked-by: Harald Welte <laforge@gnumonks.org>
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
