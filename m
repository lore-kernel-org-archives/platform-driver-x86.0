From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] x86: Don't enable EEEPC_LAPTOP in default configs
Date: Thu, 19 May 2011 12:54:00 +0100
Message-ID: <20110519115400.GA10725@srcf.ucam.org>
References: <20110519134701.1d3a8d55@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43423 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753793Ab1ESLyK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2011 07:54:10 -0400
Content-Disposition: inline
In-Reply-To: <20110519134701.1d3a8d55@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org

On Thu, May 19, 2011 at 01:47:01PM +0200, Jean Delvare wrote:
> Can someone explain why CONFIG_EEEPC_LAPTOP=y in x86/configs/*_defconfig
> when all other laptop support is off by default?

Linus owns an Eee?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
