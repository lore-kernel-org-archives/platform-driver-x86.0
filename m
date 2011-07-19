From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Wed, 20 Jul 2011 07:03:55 +0900
Message-ID: <20110719220354.GD16532@kamineko.org>
References: <4DE8FE7B.6090602@absence.it>
 <20110612222123.GB31095@kamineko.org>
 <4DF55356.9020405@absence.it>
 <4DFD2F83.40803@absence.it>
 <cc703738-d0d7-4a07-8111-50bb7a1e1f24@email.android.com>
 <4E09A72E.5050903@absence.it>
 <4E0DA75D.2090801@absence.it>
 <4E1E19DD.6050401@absence.it>
 <20110714220515.GB7586@kamineko.org>
 <4E2447E4.8080108@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55687 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073Ab1GSWD1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jul 2011 18:03:27 -0400
Received: by pzk3 with SMTP id 3so5494278pzk.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jul 2011 15:03:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4E2447E4.8080108@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jul 18, 2011 at 04:49:08PM +0200, Marco Chiappero wrote:
> Il 15/07/2011 00:05, Mattia Dongili ha scritto:
> 
> >>>I recently uploaded the first part (new features excluded) of my v2
> >>>patches at http://www.absence.it/vaio-acpi/source/patches/patchset-v2/
> >>>to help you and receive new feedbacks.
> >>
> >>Still no feedbacks...
> >
> >still not much time. what I noticed so far:
> >- patches are 14 instead of 25, any reason?
> 
> Because writing patches is time consuming. The first 14 patches
> include code cleaning/reorganization and improvements that can be
> merged immediately (if they look fine now), while the new features
> are a bit more problematic. Please, just review these 14 patches at
> the moment.

send the patches to the mailing list please. There are more eyes
watching, they are archived and they can be quoted in emails.

> >- still stopping handlers evaluation if the magi SncSupported string is
> >   not present
> 
> I do believe it's a good thing to have it. Do you prefer to drop the
> while patch #14 or just to change that check?

I thought I made it clear already. Stopping evaluation of handlers will
break things and make the driver less maintainable. If you want to print
a debug message about SncSupported is up to you. I don't mind.

> >- the function naming in patch 5 looks ok.
> 
> Do you wish to include the change from
> 
> 	struct sony_nc_handles {
> 		u16 cap[0x10];
> 		struct device_attribute devattr;
> 	};
> 
> 	static struct sony_nc_handles *handles;
> 
> to
> 
> 	struct sony_nc_handles_list {
> 		u16 cap[0x10];
> 		struct device_attribute devattr;
> 	};
> 
> 	static struct sony_nc_handles_list *handles;
> 
> as well?
> 
> >Once again, post the patches here with proper description, it's easier
> >for everyone to review and comment the changes.
> 
> I'm still waiting for a few replies [1], I'd rather avoid spending

You've got your replies now, for the rest propose your solutions.
-- 
mattia
:wq!
