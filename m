From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: set pcc after null
 device check to avoid null pointer dereference
Date: Mon, 28 Mar 2016 22:20:06 +0200
Message-ID: <20160328202006.GE27418@nataraja>
References: <1459182372-14018-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54307 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbcC1Vhi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 17:37:38 -0400
Content-Disposition: inline
In-Reply-To: <1459182372-14018-1-git-send-email-colin.king@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Colin King <colin.king@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 28, 2016 at 05:26:12PM +0100, Colin King wrote:
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Harald Welte <laforge@gnumonks.org>
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
