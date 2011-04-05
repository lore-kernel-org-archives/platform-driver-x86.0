From: Marco Chiappero <marco@absence.it>
Subject: Commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8
Date: Tue, 05 Apr 2011 18:17:24 +0200
Message-ID: <4D9B4094.4010609@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:33470 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753793Ab1DEQRd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Apr 2011 12:17:33 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Javier Achirica <achirica@gmail.com>, Mattia Dongili <malattia@linux.it>

Hello,

I just wanted to report possible issues related to the new backlight 
control implemented in commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8 
[sony-laptop: implement new backlight control method]. I and Javier 
Achirica have been using it for a while on different notebook models and 
agree that values close to 0 are far too dark to be useful, while 0 
means totally off for both. Moreover flickering has been reported with 
CCFL LCDs (still present on a few models, such as the Vaio F) by another 
tester.
In fact, with these Vaios, Windows never goes below a certain model 
specific backlight lower bound, provided along with the ALS capability. 
However, this requires further code not yet implemented (or the ALS 
support already available but not yet included). Please consider 
correcting or delaying that patch.
Thanks.

Marco Chiappero
