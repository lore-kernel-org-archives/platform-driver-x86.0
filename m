From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH v2 1/2] apple-gmux: Fix index read functions
Date: Sat, 25 Aug 2012 19:47:59 -0500
Message-ID: <20120826004759.GB20735@ubuntu-mba51>
References: <50388C45.6030707@gmail.com>
 <1345883449-2790-1-git-send-email-bfroemel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50188 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753Ab2HZAsF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Aug 2012 20:48:05 -0400
Content-Disposition: inline
In-Reply-To: <1345883449-2790-1-git-send-email-bfroemel@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bernhard Froemel <bfroemel@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Bernhard Froemel <froemel@vmars.tuwien.ac.at>

On Sat, Aug 25, 2012 at 10:30:48AM +0200, Bernhard Froemel wrote:
> From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
> 
> Study of Apple's binary driver revealed that the GMUX_READ_PORT should
> be written between calls to gmux_index_wait_ready and
> gmux_index_wait_complete (i.e., the new index protocol must be
> followed). If this is not done correctly, the indexed
> gmux device only partially accepts writes which lead to problems
> concerning GPU switching. Special thanks to Seth Forshee who helped
> greatly with identifying unnecessary changes.
> 
> Signed-off-by: Bernhard Froemel <froemel@vmars.tuwien.ac.at>

This does better match what Apple's driver does. Thanks Bernhard.

Acked-by: Seth Forshee <seth.forshee@canonical.com>
