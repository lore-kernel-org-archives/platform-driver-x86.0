From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: Enable rfkill on Inspiron 3437
Date: Wed, 7 May 2014 12:53:17 +0100
Message-ID: <20140507115317.GA818@srcf.ucam.org>
References: <1399446603-8467-1-git-send-email-yidi.lin@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57841 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932085AbaEGLxU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 May 2014 07:53:20 -0400
Content-Disposition: inline
In-Reply-To: <1399446603-8467-1-git-send-email-yidi.lin@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Edward Lin <yidi.lin@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, yk@canonical.com

The information we had from Dell is that the rfkill functionality isn't 
validated on Inspiron devices. How do we know this works under all 
circumstances?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
