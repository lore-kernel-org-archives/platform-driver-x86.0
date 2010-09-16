From: Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v2] dell-laptop: Add debugfs support
Date: Thu, 16 Sep 2010 12:46:36 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1009161239140.2727@localhost.localdomain>
References: <AANLkTime84o+hJWVDegQWHxcvUiftKW-2psW5tv4a-yR@mail.gmail.com>
 <1284607186-13129-1-git-send-email-keng-yu.lin@canonical.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vms173005pub.verizon.net ([206.46.173.5]:47287 "EHLO
	vms173005pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753556Ab0IPQrB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Sep 2010 12:47:01 -0400
In-reply-to: <1284607186-13129-1-git-send-email-keng-yu.lin@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Keng-Yu Lin <keng-yu.lin@canonical.com>
Cc: mjg59@srcf.ucam.org, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, superm1@ubuntu.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


> +#ifdef CONFIG_DEBUG_FS

Looks like you can delete these.

Of course you'd want to properly check the return value
from debugfs_create_dir(), which returns an ERR_PTR
when CONFIG_DEBUG_FS is not defined. (even though
few in the kernel seem to be bothering to use IS_ERR() here.)

cheers,
Len Brown, Intel Open Source Technology Center
