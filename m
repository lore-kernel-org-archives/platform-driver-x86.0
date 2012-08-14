From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH V2 2/2] apple_gmux: Add support for newer hardware
Date: Mon, 13 Aug 2012 19:46:25 -0500
Message-ID: <20120814004625.GB18992@thinkpad-t410>
References: <1344898369-4944-1-git-send-email-mjg@redhat.com>
 <1344898369-4944-2-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:55055 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753197Ab2HNAqh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 20:46:37 -0400
Content-Disposition: inline
In-Reply-To: <1344898369-4944-2-git-send-email-mjg@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Bernhard Froemel <froemel@vmars.tuwien.ac.at>

On Mon, Aug 13, 2012 at 06:52:49PM -0400, Matthew Garrett wrote:
> New gmux devices have a different method for accessing the registers.
> Update the driver to cope. Incorporates feedback from Bernhard Froemel.
> 
> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> Cc: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
> Cc: Seth Forshee <seth.forshee@canonical.com>

Acked-by: Seth Forshee <seth.forshee@canonical.com>
