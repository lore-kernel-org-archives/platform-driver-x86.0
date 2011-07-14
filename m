From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Fri, 15 Jul 2011 07:05:16 +0900
Message-ID: <20110714220515.GB7586@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE8FE7B.6090602@absence.it>
 <20110612222123.GB31095@kamineko.org>
 <4DF55356.9020405@absence.it>
 <4DFD2F83.40803@absence.it>
 <cc703738-d0d7-4a07-8111-50bb7a1e1f24@email.android.com>
 <4E09A72E.5050903@absence.it>
 <4E0DA75D.2090801@absence.it>
 <4E1E19DD.6050401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43461 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932119Ab1GNWEa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jul 2011 18:04:30 -0400
Received: by iyb12 with SMTP id 12so623989iyb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2011 15:04:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4E1E19DD.6050401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Thu, Jul 14, 2011 at 12:19:09AM +0200, Marco Chiappero wrote:
> Il 01/07/2011 12:54, Marco Chiappero ha scritto:
> >Il 28/06/2011 12:04, Marco Chiappero ha scritto:
> >>To get a better idea, have a look at this modified source, using the
> >>naming schema I'm proposing:
> >>http://www.absence.it/vaio-acpi/source/sony-laptop_dev_28062011.c
> >
> >I recently uploaded the first part (new features excluded) of my v2
> >patches at http://www.absence.it/vaio-acpi/source/patches/patchset-v2/
> >to help you and receive new feedbacks.
> 
> Still no feedbacks...

still not much time. what I noticed so far:
- patches are 14 instead of 25, any reason?
- still stopping handlers evaluation if the magi SncSupported string is
  not present
- the function naming in patch 5 looks ok.

Once again, post the patches here with proper description, it's easier
for everyone to review and comment the changes.
-- 
mattia
:wq!
