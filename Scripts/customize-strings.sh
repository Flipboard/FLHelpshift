#!/bin/bash
# https://github.com/Flipboard/Flipboard-iOS/commit/48393b1a41158fb98ae8fa4e8b36b0ac8ca4715e

declare -a keys=(
"Hated it"
"Loved it"
"Any other feedback? (optional)"
"What\'s your feedback about our customer support?"
"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?"
"Email invalid"
"Please enter a brief description of the issue you are facing."
"New message from Support"
"new messages from Support"
)

declare -a de_strings=(
"\"Hated it\" = \"Nein\";"
"\"Loved it\" = \"Ja\";"
"\"Any other feedback? (optional)\" = \"Ergänzende Kommentare\";"
"\"What\'s your feedback about our customer support?\" = \"War unser Support hilfreich?\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Das tut uns leid. Bitte geben Sie uns ein paar Details zu Ihrem Problem.\";"
"\"Email invalid\" = \"Ungültige E-Mail-Adresse\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Bitte erklären Sie Ihr Problem in kurzen Worten.\";"
"\"New message from Support\" = \"Neue Nachricht vom Support\";"
"\"new messages from Support\" = \"neue Nachrichten vom Support\";"
)

declare -a en_strings=(
"\"Hated it\" = \"Poor\";"
"\"Loved it\" = \"Awesome!\";"
"\"Any other feedback? (optional)\" = \"Any other feedback you want to share with us? (optional)\";"
"\"What\'s your feedback about our customer support?\" = \"Please rate your Support experience with us today\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Sorry to hear that. Could you please tell us a little bit more about the problem you are having?\";"
"\"Email invalid\" = \"Invalid email\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Please enter a brief description of the issue you are having.\";"
"\"New message from Support\" = \"New message from Flipboard Support\";"
"\"new messages from Support\" = \"new messages from Flipboard Support\";"
)

declare -a es_strings=(
"\"Hated it\" = \"Mala\";"
"\"Loved it\" = \"¡Increíble!\";"
"\"Any other feedback? (optional)\" = \"¿Tienes alguna sugerencia adicional para ayudarnos a mejorar? (opcional)\";"
"\"Would you like to review the app?\" = \"¿Le gustaría valorar la app?\";"
"\"What\'s your feedback about our customer support?\" = \"Por favor califica tu experiencia de hoy con nuestro equipo de Soporte\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Lo sentimos. ¿Nos cuenta un poco más del problema que está teniendo?\";"
"\"Email invalid\" = \"Dirección de correo electrónico no válida\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Escriba una breve descripción del problema que está teniendo.\";"
"\"New message from Support\" = \"Nuevo mensaje de apoyo\";"
"\"new messages from Support\" = \"nuevos mensajes de apoyo\";"
)

declare -a fr_strings=(
"\"Hated it\" = \"Médiocre\";"
"\"Loved it\" = \"Géniale !\";"
"\"Any other feedback? (optional)\" = \"Avez-vous des commentaires supplémentaires à partager avec nous ? (facultatif)\";"
"\"Would you like to review the app?\" = \"Voulez-vous évaluer l'appli?\";"
"\"What\'s your feedback about our customer support?\" = \"Veuillez nous faire part de votre expérience avec notre service d'assistance aujourd'hui\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Nous sommes désolés. Pourriez-vous nous en dire un peu plus au sujet du problème que vous avez rencontré?\";"
"\"Email invalid\" = \"Adresse courriel non-valide\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Veuillez écrire une brève description du problème que vous avez rencontré.\";"
"\"New message from Support\" = \"Nouveau message de soutien\";"
"\"new messages from Support\" = \"nouveaux messages de soutien\";"
)

declare -a it_strings=(
"\"Hated it\" = \"Scarso\";"
"\"Loved it\" = \"Fantastico\";"
"\"Any other feedback? (optional)\" = \"Hai altri suggerimenti da proporci? (facoltativo)\";"
"\"Would you like to review the app?\" = \"Vorresti recensire la app?\";"
"\"What\'s your feedback about our customer support?\" = \"Ti chiediamo la cortesia di valutare il nostro servizio di assistenza\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Siamo molto spiacenti. Puoi fornirci maggiori informazioni sul problema che hai riscontrato?\";"
"\"Email invalid\" = \"E-mail non valida\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Inserisci una breve descrizione del problema che hai riscontrato.\";"
"\"New message from Support\" = \"Nuovo messaggio da supporto\";"
"\"new messages from Support\" = \"nuovi messaggi da supporto\";"
)

declare -a ja_strings=(
"\"Hated it\" = \"良くない\";"
"\"Loved it\" = \"素晴らしい\";"
"\"Any other feedback? (optional)\" = \"その他のフィードバックはありますか？（オプショナル）\";"
"\"Would you like to review the app?\" = \"アプリを評価しますか？\";"
"\"What\'s your feedback about our customer support?\" = \"カスタマーサポートの評価をしてください\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"申し訳ございませんが、直面されている問題についてもう少し詳しく教えていただけませんか?\";"
"\"Email invalid\" = \"メールが無効です\";"
"\"Please enter a brief description of the issue you are facing.\" = \"直面されている問題を簡単に説明してください。\";"
"\"New message from Support\" = \"サポートからの新規メッセージ\";"
"\"new messages from Support\" = \"サポートからの新規メッセージ\";"
)

declare -a ko_strings=(
"\"Hated it\" = \"별로임\";"
"\"Loved it\" = \"최고임\";"
"\"Any other feedback? (optional)\" = \"다른 피드백이 있으신가요? (선택사항)\";"
"\"Would you like to review the app?\" = \"앱의 리뷰를 작성하시겠습니까?\";"
"\"What\'s your feedback about our customer support?\" = \"저희 도움말 이용 경험을 평가해 주세요\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"문제가 발생했다니 죄송합니다. 발생한 문제에 대해 좀 더 자세히 설명해주시겠습니까?\";"
"\"Email invalid\" = \"잘못된 이메일\";"
"\"Please enter a brief description of the issue you are facing.\" = \"발생한 문제에 대해 간략히 설명해주세요.\";"
"\"New message from Support\" = \"지원팀이 보낸 새 메시지\";"
"\"new messages from Support\" = \"개의 지원팀의 새 메시지\";"
)

declare -a pt_strings=(
"\"Hated it\" = \"Ruim\";"
"\"Loved it\" = \"Ótimo!\";"
"\"Any other feedback? (optional)\" = \"Algum comentário ou sugestão que você gostaria de compartilhar conosco? (opcional)\";"
"\"Would you like to review the app?\" = \"Gostaria de fazer uma análise da aplicação?\";"
"\"What\'s your feedback about our customer support?\" = \"Por favor, avalie o atendimento da nossa equipe de suporte\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Triste por ouvir isso. Você poderia nos contar um pouco mais sobre o problema que você está enfrentando?\";"
"\"Email invalid\" = \"E-mail inválido\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Por favor, digite uma breve descrição do problema que você está enfrentando.\";"
"\"New message from Support\" = \"Nova mensagem de apoio\";"
"\"new messages from Support\" = \"novas mensagens de apoio\";"
)

declare -a ru_strings=(
"\"Hated it\" = \"Плохо\";"
"\"Loved it\" = \"Отлично!\";"
"\"Any other feedback? (optional)\" = \"Будем благодарны за дополнительные комментарии\";"
"\"Would you like to review the app?\" = \"Не хотели бы вы оставить отзыв о приложении?\";"
"\"What\'s your feedback about our customer support?\" = \"Пожалуйста, оцените наш уровень поддержки по шкале\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Жаль об этом слышать. Не могли бы вы рассказать немного подробнее о проблеме, с которой столкнулись?\";"
"\"Email invalid\" = \"Некорректная эл.почта\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Пожалуйста, введите краткое описание проблемы, с которой вы столкнулись.\";"
"\"New message from Support\" = \"Новое сообщение от поддержки\";"
"\"new messages from Support\" = \"новых сообщений от поддержки\";"
)

declare -a tr_strings=(
"\"Hated it\" = \"Zayıf\";"
"\"Loved it\" = \"Müthiş!\";"
"\"Any other feedback? (optional)\" = \"Bizimle paylaşmak istediğiniz başka yorumunuz var mı? (isteğe bağlı)\";"
"\"Would you like to review the app?\" = \"Uygulamayı değerlendirmek istiyor musunuz?\";"
"\"What\'s your feedback about our customer support?\" = \"Lütfen bugün aldığınız desteğin kalitesi için puan verin\";"
"\"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?\" = \"Bunu duyduğumuza üzüldük. Yaşadığınız sorunla ilgili biraz daha bilgi verebilir misiniz?\";"
"\"Email invalid\" = \"E-posta geçersiz\";"
"\"Please enter a brief description of the issue you are facing.\" = \"Lütfen yaşadığınız sorunu kısaca açıklayın.\";"
"\"New message from Support\" = \"Destek'ten yeni mesajınız var\";"
"\"new messages from Support\" = \"Destek'ten yeni mesajlarınız var\";"
)


localized_files_dir=$1
localized_files_list=$(find $localized_files_dir/* -type d)

locales_cont=0

for dir in $localized_files_list; do

    ## extract locale name from file
    file_name=$(basename "$dir")
    locale_name="${file_name%.*}"

    suffix="_strings"

    ## for each key, find the string from the appropriate strings array
    i=0
    for key in "${keys[@]}";do
        replace_with_string=$locale_name$suffix[$i]
        
	## do the replacement with sed. run it in the shell to avoid complexity of escaping single quotes
        `sed -i -e "s/.*$key.*/${!replace_with_string}/" $dir/HelpshiftLocalizable.strings`
	##echo "sed -i -e \"s/.*$key.*/${!replace_with_string}/\" $dir/HelpshiftLocalizable.strings"
        (( i++ ))
    done
    
    (( locales_count++ ))
    if [ "$locales_count" = "2" ]; then
    exit
    fi
done

