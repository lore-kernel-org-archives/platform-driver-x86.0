From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8
Date: Tue, 12 Apr 2011 16:20:09 +0100
Message-ID: <20110412152009.GA32032@srcf.ucam.org>
References: <4D9B4094.4010609@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53415 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380Ab1DLPUQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2011 11:20:16 -0400
Content-Disposition: inline
In-Reply-To: <4D9B4094.4010609@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <achirica@gmail.com>, Mattia Dongili <malattia@linux.it>

On Tue, Apr 05, 2011 at 06:17:24PM +0200, Marco Chiappero wrote:

> I just wanted to report possible issues related to the new backlight
> control implemented in commit
> 7751ab8e600f26e10c2ba12a92d48a4852a51da8 [sony-laptop: implement new
> backlight control method]. I and Javier Achirica have been using it
> for a while on different notebook models and agree that values close
> to 0 are far too dark to be useful, while 0 means totally off for
> both. Moreover flickering has been reported with CCFL LCDs (still
> present on a few models, such as the Vaio F) by another tester.
> In fact, with these Vaios, Windows never goes below a certain model
> specific backlight lower bound, provided along with the ALS
> capability. However, this requires further code not yet implemented
> (or the ALS support already available but not yet included). Please
> consider correcting or delaying that patch.

Hmm. How low is useful? There's no real problem with shifting everything 
by an offset.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
