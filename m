From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-wmi: Change debug statements from pr_info to
 pr_debug
Date: Mon, 21 Nov 2011 20:52:30 +0000
Message-ID: <20111121205230.GA14467@srcf.ucam.org>
References: <1321908536-5163-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33009 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517Ab1KUUwe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Nov 2011 15:52:34 -0500
Content-Disposition: inline
In-Reply-To: <1321908536-5163-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

They're intended to be there, in the same way that the keyboard code 
generates unknown scancode errors. We want to know when users have keys 
that don't work.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
