From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 6/6] platform/x86: Add RFKILL dependency to
 toshiba_bluetooth driver
Date: Sun, 3 May 2015 12:47:55 -0700
Message-ID: <20150503194755.GE16105@fury.dvhart.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
 <1430166770-15060-7-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51564 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751540AbbECTr4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 15:47:56 -0400
Content-Disposition: inline
In-Reply-To: <1430166770-15060-7-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2015 at 02:32:50PM -0600, Azael Avalos wrote:
> This patch simply adds the RFKILL dependency to Kconfig, as we are
> now using rfkill code on the driver.

This should be added at the same time, or before, the dependency was added - not
after as it leaves a small window of broken dependencies in the history.

-- 
Darren Hart
Intel Open Source Technology Center
